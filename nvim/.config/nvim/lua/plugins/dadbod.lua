return {
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1

      -- Set preview window height for query results (default is 12)
      vim.o.previewheight = 30

      -- Load databases from ~/.config/nvim-databases.lua (outside of dotfiles repo)
      local ok, dbs = pcall(dofile, vim.fn.expand("~/.config/nvim-databases.lua"))
      if ok then
        -- Extract just the name/url for dadbod, store full config for port-forwarding
        vim.g.db_ui_dbs_config = dbs
        local db_list = {}
        for _, db in ipairs(dbs) do
          table.insert(db_list, { name = db.name, url = db.url })
        end
        vim.g.dbs = db_list
      end

      -- Track port-forward jobs
      local port_forward_jobs = {}

      -- Helper to check if port is in use
      local function is_port_in_use(port)
        local handle = io.popen("lsof -i :" .. port .. " >/dev/null 2>&1 && echo 'in_use' || echo 'free'")
        if handle then
          local result = handle:read("*a"):gsub("%s+", "")
          handle:close()
          return result == "in_use"
        end
        return false
      end

      -- Start port-forwarding for a database
      local function start_port_forward(db)
        if not db.port_forward or not db.port then
          return
        end

        -- Check if port is already forwarded
        if is_port_in_use(db.port) then
          vim.notify("Port " .. db.port .. " already in use for " .. db.name, vim.log.levels.INFO)
          return
        end

        -- Start port-forward in background
        local job_id = vim.fn.jobstart(db.port_forward, {
          detach = true,
          on_exit = function(_, code)
            if code ~= 0 then
              vim.notify("Port-forward failed for " .. db.name, vim.log.levels.ERROR)
            end
            port_forward_jobs[db.name] = nil
          end,
        })

        if job_id > 0 then
          port_forward_jobs[db.name] = job_id
          vim.notify("Starting port-forward for " .. db.name .. " on port " .. db.port, vim.log.levels.INFO)
          -- Wait a moment for the port-forward to establish
          vim.defer_fn(function() end, 1000)
        end
      end

      -- Stop all port-forward jobs
      local function stop_all_port_forwards()
        for name, job_id in pairs(port_forward_jobs) do
          vim.fn.jobstop(job_id)
          port_forward_jobs[name] = nil
        end
      end

      -- Start all port-forwards when opening DBUI
      local function start_all_port_forwards()
        local dbs_config = vim.g.db_ui_dbs_config
        if dbs_config then
          for _, db in ipairs(dbs_config) do
            start_port_forward(db)
          end
        end
      end

      -- Expose functions globally
      _G.DadbodStartPortForwards = start_all_port_forwards
      _G.DadbodStopPortForwards = stop_all_port_forwards

      -- Close all dadbod buffers and tab with q
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "dbui", "dbout", "sql" },
        callback = function()
          vim.keymap.set("n", "q", function()
            -- Close the current tab (which contains all dadbod windows)
            vim.cmd("tabclose")
          end, { buffer = true, desc = "Close DBUI tab" })
        end,
      })

      -- Clean up dadbod buffers before saving session
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          stop_all_port_forwards()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local name = vim.api.nvim_buf_get_name(buf)
            local ft = vim.bo[buf].filetype
            if
              ft == "dbui"
              or ft == "dbout"
              or name:match("%.dbout$")
              or name:match("db_ui")
              or name:match("%.local/share/db_ui/")
              or name:match("/T/nvim%..*/")
            then
              pcall(vim.api.nvim_buf_delete, buf, { force = true })
            end
          end
        end,
      })
    end,
    keys = {
      {
        "<leader>D",
        function()
          -- Start port-forwards then open DBUI
          if _G.DadbodStartPortForwards then
            _G.DadbodStartPortForwards()
          end
          vim.cmd("tabnew | DBUI")
        end,
        desc = "Open DBUI in new tab",
      },
    },
  },
}

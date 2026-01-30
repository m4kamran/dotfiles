-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Cache ESLint availability per buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "eslint" then
      vim.b[args.buf].has_eslint = true
    end
  end,
  desc = "Detect ESLint LSP attachment",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function(args)
    if vim.b[args.buf].has_eslint then
      vim.cmd("silent! EslintFixAll")
    end
  end,
  desc = "Auto fix ESLint errors on save",
})

local function setup_dynamic_diagnostics()
  local current_mode = "virtual_text"
  local timer = vim.uv.new_timer()
  local diag_grp = vim.api.nvim_create_augroup("DynamicDiagnostics", { clear = true })

  local function show_virtual_lines()
    if current_mode ~= "virtual_lines" then
      current_mode = "virtual_lines"
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { current_line = true },
      })
    end
  end

  local function show_virtual_text()
    if current_mode ~= "virtual_text" then
      current_mode = "virtual_text"
      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
      })
    end
  end

  vim.api.nvim_create_autocmd("CursorHold", {
    group = diag_grp,
    callback = function()
      local line = vim.api.nvim_win_get_cursor(0)[1]
      local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })
      if #diagnostics > 0 then
        show_virtual_lines()
      end
    end,
    desc = "Show virtual lines on cursor hold",
  })

  -- Only reset on CursorMoved (not CursorMovedI) to reduce overhead
  vim.api.nvim_create_autocmd({ "CursorMoved", "InsertLeave", "BufLeave" }, {
    group = diag_grp,
    callback = function()
      -- Skip if already in virtual_text mode
      if current_mode == "virtual_text" then
        return
      end
      if timer then
        timer:stop()
        timer:start(100, 0, vim.schedule_wrap(show_virtual_text))
      end
    end,
    desc = "Reset to virtual text display with debouncing",
  })

  -- Cleanup timer on exit to prevent leaks
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = diag_grp,
    callback = function()
      if timer then
        timer:stop()
        timer:close()
      end
    end,
    desc = "Cleanup diagnostic timer",
  })

  show_virtual_text()
end

-- Set up the dynamic diagnostics
setup_dynamic_diagnostics()

-- Add generated sources to jdtls classpath (cached per buffer)
local jdtls_grp = vim.api.nvim_create_augroup("JdtlsSetup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = jdtls_grp,
  pattern = "java",
  callback = function(args)
    -- Skip if already processed for this buffer
    if vim.b[args.buf].jdtls_root_cached then
      return
    end
    vim.b[args.buf].jdtls_root_cached = true

    local ok, jdtls = pcall(require, "jdtls")
    if not ok then
      return
    end

    local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml" })
    if root_dir then
      local generated_sources = root_dir .. "/target/generated-sources/messaging-manifest"
      vim.fn.setenv("JAVA_SOURCE_PATHS", generated_sources)
    end
  end,
  desc = "Add generated sources to jdtls classpath",
})

-- CMD line
-- local cmdGrp = vim.api.nvim_create_augroup("cmdline_height", { clear = true })
--
-- local function set_cmdheight(val)
--   if vim.opt.cmdheight:get() ~= val then
--     vim.opt.cmdheight = val
--     vim.cmd.redrawstatus()
--   end
-- end
--
-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   group = cmdGrp,
--   callback = function()
--     if vim.fn.getcmdtype() == ":" then
--       set_cmdheight(1)
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineChanged", {
--   group = cmdGrp,
--   callback = function()
--     if vim.fn.getcmdtype() == ":" and vim.fn.getcmdline() == "" then
--       set_cmdheight(0)
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("CmdlineLeave", {
--   group = cmdGrp,
--   callback = function()
--     set_cmdheight(0)
--   end,
-- })

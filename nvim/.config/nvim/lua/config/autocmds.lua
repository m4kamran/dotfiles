-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    if vim.fn.exists(":EslintFixAll") == 2 then
      vim.cmd("silent! EslintFixAll")
    end
  end,
  desc = "Auto fix ESLint errors on save",
})

local function setup_dynamic_diagnostics()
  local current_mode = "virtual_text"
  local timer = vim.uv.new_timer()

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
    callback = function()
      -- Skip if already in virtual_text mode
      if current_mode == "virtual_text" then
        return
      end
      timer:stop()
      timer:start(100, 0, vim.schedule_wrap(show_virtual_text))
    end,
    desc = "Reset to virtual text display with debouncing",
  })

  show_virtual_text()
end

-- Set up the dynamic diagnostics
setup_dynamic_diagnostics()

-- Add generated sources to jdtls classpath (cached per buffer)
vim.api.nvim_create_autocmd("FileType", {
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

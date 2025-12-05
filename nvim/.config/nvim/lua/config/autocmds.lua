-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    -- vim.cmd([[silent! lua LazyVim.lsp.action["source.removeUnused"]()]])

    vim.cmd("silent! EslintFixAll")
  end,
  desc = "Auto fix ESLint errors on save",
})

local function setup_dynamic_diagnostics()
  local current_mode = "virtual_text" -- Track current mode to avoid redundant config updates
  local timer = nil

  -- Function to show virtual lines for current line
  local function show_virtual_lines()
    if current_mode ~= "virtual_lines" then
      current_mode = "virtual_lines"
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = {
          current_line = true,
        },
      })
    end
  end

  -- Function to show virtual text (default state)
  local function show_virtual_text()
    if current_mode ~= "virtual_text" then
      current_mode = "virtual_text"
      vim.diagnostic.config({
        virtual_text = true,
        virtual_lines = false,
      })
    end
  end

  -- Show virtual lines on cursor hold
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

  -- Reset to virtual text when moving cursor or leaving insert mode/buffer
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "InsertLeave", "BufLeave" }, {
    callback = function()
      -- Cancel any existing timer
      if timer then
        timer:stop()
        timer = nil
      end

      -- Debounce the virtual text reset
      timer = vim.defer_fn(function()
        show_virtual_text()
        timer = nil
      end, 100)
    end,
    desc = "Reset to virtual text display with debouncing",
  })

  -- Initialize with virtual text
  show_virtual_text()
end

-- Set up the dynamic diagnostics
setup_dynamic_diagnostics()

-- Add generated sources to jdtls classpath
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls = require("jdtls")
    local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml" })

    if root_dir then
      -- Add generated sources to classpath
      local generated_sources = root_dir .. "/target/generated-sources/messaging-manifest"
      vim.fn.setenv("JAVA_SOURCE_PATHS", generated_sources)
    end
  end,
  desc = "Add generated sources to jdtls classpath",
})

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  command = "setlocal conceallevel=1",
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--     if client:supports_method('textDocument/documentColor')
--       vim.lsp.document_color.enable(true, args.buf)
--     end
--   end
-- })
-- Dynamic diagnostic display: virtual text by default, virtual lines on hover
local function setup_dynamic_diagnostics()
  local current_line = -1
  local timer = nil

  -- Function to show virtual lines for current line
  -- Function to show virtual lines for current line
  local function show_virtual_lines()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = {
        current_line = true,
      },
    })
  end

  -- Function to show virtual text (default state)
  local function show_virtual_text()
    vim.diagnostic.config({
      virtual_text = true,
      virtual_lines = false,
    })
  end

  -- Set up cursor movement detection
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function()
      local line = vim.api.nvim_win_get_cursor(0)[1]

      -- If we moved to a new line
      if line ~= current_line then
        current_line = line

        -- Cancel any existing timer
        if timer then
          timer:stop()
          timer = nil
        end

        -- Check if current line has diagnostics
        local diagnostics = vim.diagnostic.get(0, { lnum = line - 1 })

        if #diagnostics > 0 then
          -- Start timer to show virtual lines after a brief delay
          timer = vim.defer_fn(function()
            show_virtual_lines()
            timer = nil
          end, 100) -- 100ms delay
        else
          -- No diagnostics on this line, ensure virtual text is shown
          show_virtual_text()
        end
      end
    end,
    desc = "Dynamic diagnostic display on cursor movement",
  })

  -- Reset to virtual text when leaving insert mode or buffer
  vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
    callback = function()
      if timer then
        timer:stop()
        timer = nil
      end
      show_virtual_text()
    end,
    desc = "Reset to virtual text display",
  })

  -- Initialize with virtual text
  show_virtual_text()
end

-- Set up the dynamic diagnostics
setup_dynamic_diagnostics()

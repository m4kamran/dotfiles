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

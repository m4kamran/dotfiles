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

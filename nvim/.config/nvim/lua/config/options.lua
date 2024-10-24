-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.g.lazyvim_prettier_needs_config = false

vim.opt.cursorline = true
vim.opt.relativenumber = false
vim.opt.wrap = true

-- Ensure newline at end of file
vim.opt.fixeol = true -- Fix end of line (ensures an eol character at the end of file)
vim.opt.eol = true -- Adds a newline at end of file automatically

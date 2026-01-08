-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.g.lazyvim_prettier_needs_config = false
vim.g.ai_cmp = false
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_blink_main = false
vim.g.root_spec = { "cwd" }

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.sessionoptions = { "buffers", "curdir", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%l %s"
vim.opt.numberwidth = 4
vim.opt.winborder = "none"
vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "context:12",
  "algorithm:histogram",
  "linematch:200",
  "indent-heuristic",
  "iwhite", -- I toggle this one, it doesn't fit all cases.
}

vim.filetype.add({
  pattern = {
    [".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
    [".*%.mjml"] = "html", -- Sets the filetype to `html` if it matches the pattern
  },
})

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal with borderr
vim.keymap.set("n", "<C-/>", function()
  Snacks.terminal.toggle(nil, { cwd = vim.fn.getcwd() })
end, { desc = "Term toggle" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Diff View
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })

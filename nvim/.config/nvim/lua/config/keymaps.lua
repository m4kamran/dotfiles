-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

-- Jest watch
vim.api.nvim_set_keymap(
  "n",
  "<leader>tw",
  "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
  {}
)

-- Terminal with borderr
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "single" })
end, { desc = "Term with border" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Diff View
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })

-- Auto Session
vim.keymap.set("n", "<leader>qs", "<cmd>SessionSave<cr>", { desc = "Save Session" })
vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<cr>", { desc = "Load Session" })

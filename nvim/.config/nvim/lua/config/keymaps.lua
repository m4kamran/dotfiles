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

-- Remove lazyvim keymaps
-- vim.keymap.del("n", "<leader>cd")
-- vim.keymap.del("n", "<leader>gL")
-- vim.keymap.del("n", "<leader>gf")
-- vim.keymap.del("n", "<leader>gG")
-- vim.keymap.del("n", "<leader>gg")
-- vim.keymap.del("n", "<leader>ge")
-- vim.keymap.del("n", "<leader>gs")

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Neogit
-- vim.keymap.set("n", "<leader>gg", "<cmd>Neogit kind=auto <cr>", { desc = "Neogit" })
-- vim.keymap.set("n", "<leader>gc", "<cmd>Neogit commit <cr>", { desc = "Neogit Commit changes" })
-- vim.keymap.set("n", "<leader>gp", "<cmd>Neogit push<cr>", { desc = "Neogit Push changes" })
-- vim.keymap.set("n", "<leader>gP", "<cmd>Neogit pull<cr>", { desc = "Neogit Pull changes" })
-- vim.keymap.set("n", "<leader>gl", "<cmd>Neogit log <cr>", { desc = "Neogit log" })
-- vim.keymap.set("n", "<leader>gd", "<cmd>Neogit diff <cr>", { desc = "Neogit diff" })

-- Mini diff
vim.keymap.set("n", "<leader>gh", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "Mini diff" })

-- DiffView
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "DiffView" })

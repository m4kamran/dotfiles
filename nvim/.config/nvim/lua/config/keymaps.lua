-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal with borderr
vim.keymap.set("n", "<C-_>", function()
  Snacks.terminal.toggle(
    nil,
    { cwd = vim.fn.getcwd(), win = {
      relative = "editor",
      position = "bottom",
      height = 0.8,
    } }
  )
end, { desc = "Term toggle" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Diff View
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })

-- Lsp Lines
-- vim.keymap.set("", "<Leader>ce", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Remap macro recording
-- vim.keymap.set("n", "q", "<nop>", {})
-- vim.keymap.set("n", "Q", "q", { desc = "Record macro", noremap = true })

-- Jester
-- vim.keymap.set("n", "<leader>tr", "<cmd>lua require('jester').run()<cr>", { desc = "Run Jester" })
-- vim.keymap.set("n", "<leader>tt", "<cmd>lua require('jester').run_file()<cr>", { desc = "Run Jester (focused)" })
--
-- TreeWalker
-- movement
vim.keymap.set({ "n" }, "<M-j>", "<cmd>Treewalker Down<cr>", { silent = true })
vim.keymap.set({ "n" }, "<M-l>", "<cmd>Treewalker Right<cr>", { silent = true })
vim.keymap.set({ "n" }, "<M-h>", "<cmd>Treewalker Left<cr>", { silent = true })
vim.keymap.set({ "n" }, "<M-k>", "<cmd>Treewalker Up<cr>", { silent = true })

-- swapping
vim.keymap.set("n", "<D-S-j>", "<cmd>Treewalker SwapDown<cr>", { silent = true })
vim.keymap.set("n", "<D-S-k>", "<cmd>Treewalker SwapUp<cr>", { silent = true })
vim.keymap.set("n", "<D-S-l>", "<cmd>Treewalker SwapRight<CR>", { silent = true })
vim.keymap.set("n", "<D-S-h>", "<cmd>Treewalker SwapLeft<CR>", { silent = true })

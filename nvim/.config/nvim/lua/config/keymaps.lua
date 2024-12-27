-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal with borderr
vim.keymap.set("n", "<C-\\>", function()
  Snacks.terminal.toggle(
    nil,
    { cwd = vim.fn.getcwd(), win = {
      relative = "editor",
      position = "bottom",
      height = 0.5,
    } }
  )
end, { desc = "Term toggle" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Diff View
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })

-- Lsp Lines
vim.keymap.set("", "<Leader>ce", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- Remap macro recording
-- vim.keymap.set("n", "q", "<nop>", {})
-- vim.keymap.set("n", "Q", "q", { desc = "Record macro", noremap = true })

-- Jester
-- vim.keymap.set("n", "<leader>tr", "<cmd>lua require('jester').run()<cr>", { desc = "Run Jester" })
-- vim.keymap.set("n", "<leader>tt", "<cmd>lua require('jester').run_file()<cr>", { desc = "Run Jester (focused)" })

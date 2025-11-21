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
      height = 0.5,
    } }
  )
end, { desc = "Term toggle" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Yank without changing the clipboard
vim.keymap.set("x", "p", "P", { noremap = true })
vim.keymap.set("x", "P", "p", { noremap = true })

-- Move lines
vim.keymap.set("n", "<D-j>", "5j", { noremap = true })
vim.keymap.set("n", "<D-k>", "5k", { noremap = true })

-- Macro
vim.keymap.set("n", "Q", "q", { desc = "Record macro", noremap = true })
vim.keymap.set("n", "q", "<Nop>", { desc = "Disabled (use Q for macro)", noremap = true })

-- Diff View
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })

-- Lsp Lines
vim.keymap.set("n", "<leader>ue", function()
  vim.diagnostic.config({
    virtual_lines = not vim.diagnostic.config().virtual_lines,
    virtual_text = not vim.diagnostic.config().virtual_text,
  })
end, { desc = "Toggle diagnostic [l]ines" })

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Remap macro recording
-- vim.keymap.set("n", "q", "<nop>", {})
-- vim.keymap.set("n", "Q", "q", { desc = "Record macro", noremap = true })

-- Jester
-- vim.keymap.set("n", "<leader>tr", "<cmd>TestNearest<cr>", { desc = "Run Test file" })
-- vim.keymap.set("n", "<leader>tt", "<cmd>TestFile<cr>", { desc = "Run Test (focused)" })

-- lazygit in tmux
-- vim.keymap.set("n", "<leader>gg", ":!tmux window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { silent = true })

-- vim.keymap.set(
--   "n",
--   "<leader>gg",
--   ":!tmux popup -d " .. vim.fn.getcwd() .. " -xC -yC -w80\\% -h80\\% -E lazygit<CR>",
--   { silent = true }
-- )
--
--

vim.keymap.set("n", "<leader>o", "<cmd>:Other<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>oc", "<cmd>:OtherClear<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>os", "<cmd>:OtherVSplit<CR>", { noremap = true, silent = true })

-- Fyler
-- vim.keymap.set(
--   "n",
--   "<leader>e",
--   "<cmd>:Fyler kind=split_left <CR>",
--   { noremap = true, silent = true, desc = "Explorer" }
-- )

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
--

local function open_terminal()
  Snacks.terminal(nil, { cwd = LazyVim.root(), win = { height = 0.5 } })
end
vim.keymap.set({ "n", "t" }, "<c-/>", open_terminal, { desc = "Terminal (Root Dir)" })
vim.keymap.set({ "n", "t" }, "<c-_>", open_terminal, { desc = "Terminal (Root Dir)" })

-- Delete without yanking
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Yank without changing the clipboard
vim.keymap.set("x", "p", "P", { noremap = true })
vim.keymap.set("x", "P", "p", { noremap = true })

-- Move lines
vim.keymap.set("n", "<M-j>", "5j", { noremap = true })
vim.keymap.set("n", "<M-k>", "5k", { noremap = true })
vim.keymap.set("n", "<D-j>", "5j", { noremap = true })
vim.keymap.set("n", "<D-k>", "5k", { noremap = true })

-- Macro
vim.keymap.set("n", "Q", "q", { desc = "Record macro", noremap = true })
vim.keymap.set("n", "q", "<Nop>", { desc = "Disabled (use Q for macro)", noremap = true })

-- Diff View
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diff View" })
-- vim.keymap.set("n", "<leader>gd", "<cmd>CodeDiff<cr>", { desc = "Git Diff (CodeDiff)" })
vim.keymap.set("n", "<leader>gf", ":DiffviewFileHistory %<cr>", { desc = "File History" })
vim.keymap.set("n", "<leader>gH", ":DiffviewOpen develop...HEAD %<cr>", { desc = "Branch History" })
-- vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewToggle<cr>", { desc = "Toggle Diffview" })
--
-- -- Diff working directory
-- vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
-- vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })
--
-- -- File history
-- vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history (current file)" })
-- vim.keymap.set("n", "<leader>dH", "<cmd>DiffviewFileHistory<cr>", { desc = "File history (repo)" })
--
-- -- Visual mode: history for selection
-- vim.keymap.set("v", "<leader>dh", "<Esc><cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = "Range history" })
--
-- -- Single line history
-- vim.keymap.set("n", "<leader>dl", "<cmd>.DiffviewFileHistory --follow<CR>", { desc = "Line history" })
--
-- -- Diff against main/master branch (useful before merging)
-- vim.keymap.set("n", "<leader>dm", function()
--   -- Try main first, fall back to master
--   local result = vim.fn.systemlist({ "git", "rev-parse", "--verify", "main" })
--   local ok = vim.v.shell_error == 0 and result[1] ~= nil and result[1] ~= ""
--   local branch = ok and "develop" or "main" or "master"
--   vim.cmd("DiffviewOpen " .. branch)
-- end, { desc = "Diff against develop/main/master" })

-- Lsp Lines
vim.keymap.set("n", "<leader>ue", function()
  vim.diagnostic.config({
    virtual_lines = not vim.diagnostic.config().virtual_lines,
    virtual_text = not vim.diagnostic.config().virtual_text,
  })
end, { desc = "Toggle diagnostic [l]ines" })

vim.keymap.set({ "n", "i", "v" }, "<D-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Incremental treesitter selection (built-in 0.12+)
vim.keymap.set("x", "<A-o>", function()
  require("vim.treesitter._select").select_parent(vim.v.count1)
end, { desc = "Select parent treesitter node" })

vim.keymap.set("x", "<A-i>", function()
  require("vim.treesitter._select").select_child(vim.v.count1)
end, { desc = "Select child treesitter node" })

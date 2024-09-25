require "nvchad.mappings"

local map = vim.keymap.set

-- Basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- editor
map({ "n", "i", "v" }, "<c-s>", "<cmd> w <cr>")

-- lsp
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "show hover" })
map("n", "ga", "<cmd>telescope vim.lsp.buf.code_action theme=dropdown<cr>", { desc = "open code actions in telescope" })

-- indentation
map("v", "<", "<gv", { desc = "indent left " })
map("v", ">", ">gv", { desc = "indent right " })

-- tabs
map("n", "<leader>tt", "<cmd>:tabnew<cr>", { desc = "new tab" })
map("n", "<leader>tb", "<cmd>:tabprevious<cr>", { desc = "previous tab" })
map("n", "<leader>tn", "<cmd>:tabnext<cr>", { desc = "next tab" })

map(
  "n",
  "<leader>fd",
  "<cmd>Telescope dir live_grep<cr>",
  { noremap = true, silent = true, desc = "live grep in directory" }
)
map(
  "n",
  "<leader>pd",
  "<cmd>Telescope dir find_files<cr>",
  { noremap = true, silent = true, desc = "find files in directory" }
)

-- multiple cursors
vim.g.VM_default_mappings = 0 -- Disable default keybindings

-- Custom keybindings for vim-visual-multi
vim.g.VM_maps = {
  ["Find Under"] = "<C-d>", -- Ctrl + D to find the next occurrence
  ["Find Subword Under"] = "<C-d>", -- Ctrl + D for subwords
  ["Skip Region"] = "<C-x>", -- Optional: Ctrl + X to skip an occurrence
  ["Remove Region"] = "<C-p>", -- Optional: Ctrl + P to remove the current region
}

-- Open floating terminal
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm", cmd = "lazygit" }
end, { desc = "Terminal Toggle Floating term" })

-- Multi cursors
map("n", "<leader>d", "*``cgn", { desc = "search forward and change next occurrence" })
map("n", "<leader>D", "#``cgN", { desc = "Search backward and change previous occurrence" })

-- Quit
map("n", "<leader>q", ":qa<CR>", { desc = "close all windows and exit Neovim" })

-- Git signs
map("n", "<leader>gs", "<cmd>Gitsigns toggle_signs<cr>", { desc = "toggle git signs" })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "preview git hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "reset git hunk" })

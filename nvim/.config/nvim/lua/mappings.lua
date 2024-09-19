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
map("v", "<", "<gv", { desc = "indent left "})
map("v", ">", ">gv", { desc = "indent right "})


-- tabs
map("n", "<leader>tt", "<cmd>:tabnew<cr>", { desc = "new tab" })
map("n", "<leader>tb", "<cmd>:tabprevious<cr>", { desc = "previous tab" })
map("n", "<leader>tn", "<cmd>:tabnext<cr>", { desc = "next tab" })

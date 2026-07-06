return {
  "tpope/vim-fugitive",
  enabled = false,
  cmd = {
    "Git",
    "G",
    "Gdiffsplit",
    "Gvdiffsplit",
    "Gedit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GRename",
    "GDelete",
    "GRemove",
    "Gclog",
    "Gllog",
    "Gcd",
    "Glcd",
  },
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fugitive", "fugitiveblame", "git" },
      callback = function(event)
        vim.keymap.set("n", "q", "<cmd>close<cr>", {
          buffer = event.buf,
          desc = "Close Fugitive Window",
        })

        vim.keymap.set("n", "<leader>gq", "<cmd>close<cr>", {
          buffer = event.buf,
          desc = "Close Fugitive Window",
        })
      end,
    })
  end,
  keys = {
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git Status (Fugitive)" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame (Fugitive)" },
    { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git Stage File (Fugitive)" },
    { "<leader>gr", "<cmd>Gread<cr>", desc = "Git Restore File (Fugitive)" },
    { "<leader>gD", "<cmd>Gvdiffsplit<cr>", desc = "Git Vertical Diff (Fugitive)" },
    { "<leader>gQ", "<cmd>Git difftool<cr>", desc = "Git Difftool Quickfix (Fugitive)" },
  },
}

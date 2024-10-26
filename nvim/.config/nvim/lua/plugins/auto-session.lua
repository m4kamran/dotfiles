return {
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      auto_restore = false,
    },
    keys = {
      { "n", "<leader>qs", "<cmd>SessionToggleAutoSave<CR>" },
      { "n", "<leader>qd", "<cmd>SessionDelete<CR>" },
    },
  },
}

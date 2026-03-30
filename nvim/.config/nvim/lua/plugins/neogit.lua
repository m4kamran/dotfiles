return {
  "NeogitOrg/neogit",
  enabled = false,
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional
    "folke/snacks.nvim", -- optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit kind=tab<cr>", desc = "Show Neogit UI" },
  },
}

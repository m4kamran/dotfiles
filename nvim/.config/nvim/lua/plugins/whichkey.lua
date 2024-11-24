return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      preset = "helix",
      delay = function(ctx)
        return 0
      end,
    },
  },
}

return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      indent_guides = false, -- show indent guides
      auto_refresh = false, -- don't auto-update as cursor moves
      follow = false, -- don't follow cursor position
      win = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.4,
      },
    },
  },
}

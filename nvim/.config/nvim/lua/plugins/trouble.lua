return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      win = {
        type = "split", -- split window
        relative = "win", -- relative to current window
        position = "bottom", -- right side
        size = 0.3,
      },
    },
  },
}

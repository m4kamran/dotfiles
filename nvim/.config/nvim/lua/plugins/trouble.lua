return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      win = {
        type = "split", -- split window
        relative = "win", -- relative to current window
        position = "right", -- right side
        size = 0.5, -- 50% of the window
      },
    },
  },
}

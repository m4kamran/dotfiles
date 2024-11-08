return {
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "echasnovski/mini.icons" },
    },
    opts = {
      show_icons = true,
      leader_key = ";", -- Recommended to be a single key
      buffer_leader_key = "m", -- Per Buffer Mappings

      index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
      window = { -- controls the appearance and position of an arrow window (see nvim_open_win() for all options)
        width = "auto",
        height = "auto",
        row = "auto",
        col = "auto",
        border = "none",
      },
    },
  },
}

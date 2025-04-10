return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = {
        linelength = 800,
      },
      notifier = { enabled = false },
      words = { enabled = false },
      indent = { enabled = false },
      animate = { enabled = false },
      scroll = { enabled = false },
      image = {},
      dashboard = {
        preset = {
          header = [[
            _   .-')              .-. .-')
            ( '.( OO )_            \  ( OO )
            ,--.   ,--.)   .---.  ,--. ,--.
            |   `.'   |   / .  |  |  .'   /
            |         |  / /|  |  |      /,
            |  |'.'|  | / / |  |_ |     ' _)
            |  |   |  |/  '-'    ||  .   \
            |  |   |  |`----|  |-'|  |\   \
            `--'   `--'     `--'  `--' '--'
          ]],
        },
      },
      picker = {
        sources = {
          explorer = {
            diagnostics = false,
            layout = {
              cycle = false,
              preview = false,
              layout = {
                backdrop = false,
                width = 50,
                min_width = 40,
                height = 0,
                position = "left",
                border = "none",
                box = "vertical",
              },
            },
          },
        },
      },
    },
  },
}

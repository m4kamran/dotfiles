return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader>/",
        function()
          Snacks.picker.resume({ source = "grep" })
        end,
        desc = "Grep (Root Dir)",
      },
    },
    opts = {
      bigfile = {
        linelength = 800,
      },
      notifier = { enabled = false },
      words = { enabled = false },
      indent = { enabled = false },
      animate = { enabled = false },
      image = {},
      dashboard = {
        preset = {
          header = [[
          ]],
        },
      },
      lazygit = {
        config = {
          os = {
            edit = '[ -z ""$NVIM"" ] && (nvim -- {{filename}}) || (nvim --server ""$NVIM"" --remote-send ""q"" && nvim --server ""$NVIM"" --remote {{filename}})',
          },
        },
      },
      picker = {
        sources = {
          explorer = {
            ---@diagnostic disable-next-line: missing-fields
            icons = {
              tree = {
                vertical = "  ",
                middle = "  ",
                last = "  ",
              },
            },
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

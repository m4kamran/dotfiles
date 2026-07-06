return {
  {
    "A7Lavinraj/fyler.nvim",
    enabled = false,
    branch = "stable",
    dependencies = { "nvim-mini/mini.icons" },
    lazy = false,
    keys = {
      {
        "<leader>e",
        function()
          require("fyler").toggle({ dir = LazyVim.root(), kind = "split_left_most" })
        end,
        desc = "Toggle Fyler (Root Dir)",
      },
      {
        "<leader>E",
        function()
          require("fyler").open({ kind = "split_left_most" })
        end,
        desc = "Explorer Fyler (cwd)",
      },
    },
    opts = {
      integrations = {
        icon = "mini_icons",
      },
      views = {
        finder = {
          default_explorer = true,
          follow_current_file = true,
          watcher = {
            enabled = true,
          },
          win = {
            kind = "split_left_most",
            kinds = {
              split_left_most = {
                width = 40,
                win_opts = {
                  winfixwidth = true,
                },
              },
            },
          },
        },
      },
    },
  },
}

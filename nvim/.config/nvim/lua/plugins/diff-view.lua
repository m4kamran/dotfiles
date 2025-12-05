return {
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        keymaps = {
          view = {
            { "n", "q", "<cmd>tabclose <cr>", { desc = "Close diffview" } },
            { "n", "<leader>q", "<cmd>tabclose <cr>", { desc = "Close diffview" } },
          },
          file_panel = {
            { "n", "q", "<cmd>tabclose <cr>", { desc = "Close diffview" } },
            { "n", "<leader>q", "<cmd>tabclose <cr>", { desc = "Close diffview" } },
          },
        },

        file_panel = {
          listing_style = "tree", -- One of 'list' or 'tree'
          tree_options = { -- Only applies when listing_style is 'tree'
            flatten_dirs = true, -- Flatten dirs that only contain one single dir
            folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
          },
          win_config = { -- See |diffview-config-win_config|
            position = "left",
            width = 50,
            win_opts = {},
          },
        },
        hooks = {
          view_enter = function(bufnr)
            vim.diagnostic.config({
              virtual_lines = false,
            })
          end,
          view_leave = function(bufnr)
            vim.diagnostic.config({
              virtual_lines = true,
            })
          end,
        },
      })
    end,
  },
  -- {
  --   "esmuellert/vscode-diff.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   cmd = "CodeDiff",
  --   opts = {
  --     keymaps = {
  --       view = {
  --         quit = "q", -- Close diff tab
  --         toggle_explorer = "<leader>e", -- Toggle explorer visibility (explorer mode only)
  --         next_hunk = "]c", -- Jump to next change
  --         prev_hunk = "[c", -- Jump to previous change
  --         next_file = "<Tab>", -- Next file in explorer mode
  --         prev_file = "<S-Tab>", -- Previous file in explorer mode
  --       },
  --       explorer = {
  --         select = "<CR>", -- Open diff for selected file
  --         hover = "K", -- Show file diff preview
  --         refresh = "R", -- Refresh git status
  --       },
  --     },
  --   },
  -- },
}

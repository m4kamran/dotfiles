return {
  {
    "sindrets/diffview.nvim",
    enabled = false,
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        enhanced_diff_hl = true,
        diff_binaries = false,
        use_icons = true,
        view = {
          default = {
            layout = "diff2_horizontal",
            winbar_info = true,
            disable_diagnostics = true,
          },
          merge_tool = {
            layout = "diff3_horizontal", -- LOCAL | BASE | REMOTE
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = "diff2_horizontal",
            winbar_info = true,
          },
        },
        keymaps = {
          view = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
            { "n", "<leader>q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
            -- Conflict resolution
            { "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose OURS" } },
            { "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose THEIRS" } },
            { "n", "<leader>cb", actions.conflict_choose("base"), { desc = "Choose BASE" } },
            { "n", "<leader>ca", actions.conflict_choose("all"), { desc = "Choose ALL" } },
            { "n", "<leader>cn", actions.conflict_choose("none"), { desc = "Choose NONE" } },
            -- Navigate conflicts
            { "n", "]x", actions.next_conflict, { desc = "Next conflict" } },
            { "n", "[x", actions.prev_conflict, { desc = "Prev conflict" } },
          },
          file_panel = {
            { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
            { "n", "<leader>q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
          },
        },

        file_panel = {
          listing_style = "tree",
          tree_options = {
            flatten_dirs = true,
            folder_statuses = "only_folded",
          },
          win_config = {
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
}

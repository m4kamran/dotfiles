return {
  {
    "dlyongemallo/diffview.nvim",
    config = function()
      local actions = require("diffview.actions")

      -- Define per-side diff highlight groups
      -- Left panel (old/before): red tones
      vim.api.nvim_set_hl(0, "DiffviewOldChange", { bg = "#2e2020" })
      vim.api.nvim_set_hl(0, "DiffviewOldText", { bg = "#5a2020" })
      -- Right panel (new/after): green tones
      vim.api.nvim_set_hl(0, "DiffviewNewChange", { bg = "#1e2e1e" })
      vim.api.nvim_set_hl(0, "DiffviewNewText", { bg = "#2a5a2a" })

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
          diff_buf_win_enter = function(bufnr, winid, ctx)
            vim.wo[winid].foldenable = true
            vim.wo[winid].foldlevel = 0
            vim.wo[winid].wrap = true

            if ctx.layout_name:match("^diff2") then
              if ctx.symbol == "a" then
                -- Left panel (old/before): red tones
                vim.opt_local.winhl:prepend(table.concat({
                  "DiffAdd:DiffviewDiffAddAsDelete",
                  "DiffDelete:DiffviewDiffDeleteDim",
                  "DiffChange:DiffviewOldChange",
                  "DiffText:DiffviewOldText",
                }, ","))
              elseif ctx.symbol == "b" then
                -- Right panel (new/after): green tones
                vim.opt_local.winhl:prepend(table.concat({
                  "DiffDelete:DiffviewDiffDeleteDim",
                  "DiffChange:DiffviewNewChange",
                  "DiffText:DiffviewNewText",
                }, ","))
              end
            end
          end,
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

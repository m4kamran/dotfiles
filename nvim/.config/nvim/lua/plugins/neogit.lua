return {
  {
    "NeogitOrg/neogit",
    branch = "master",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      return require("neogit").setup({
        graph_style = "kitty",
        disable_context_highlighting = false,
        disable_commit_confirmation = false,
        disable_builtin_notifications = false,
        commit_popup = {
          kind = "auto",
        },
        integrations = {
          diffview = true,
          telescope = true,
        },
        sections = {
          untracked = {
            folded = false,
            hidden = false,
          },
          unstaged = {
            folded = false,
            hidden = false,
          },
          staged = {
            folded = false,
            hidden = false,
          },
        },
      })
    end,
  },
}

return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = {
        auto_refresh = true,
        layout = {
          position = "right",
          ratio = 0.3,
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 40,
        adaptive_size = true,
      }
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc", "html", "css", "angular", "typescript", "json", "javascript"
      },
    },
  },

  {
    "princejoogie/dir-telescope.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        hidden = true,
        no_ignore = false,
        show_preview = true,
        follow_symlinks = false,
      })
    end,
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
}

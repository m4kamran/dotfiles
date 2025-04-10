return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = {
          severity = {
            max = vim.diagnostic.severity.WARN,
          },
          current_line = true,
        },
        virtual_lines = {
          severity = {
            min = vim.diagnostic.severity.ERROR,
          },
          current_line = true,
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
          linehl = {},
          numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          },
        },
      },

      inlay_hints = { enabled = false },
      document_highlight = { enabled = false },

      servers = {
        angularls = {
          root_dir = require("lspconfig.util").root_pattern("angular.json", "nx.", "tsconfig.json", "project.json"),
        },
      },
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = { only_current_line = true },
        signs = false,
      },

      inlay_hints = { enabled = false },
      document_highlight = { enabled = false },
    },
  },
}

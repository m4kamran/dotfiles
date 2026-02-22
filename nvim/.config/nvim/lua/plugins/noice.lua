return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      hover = {
        enabled = true,
        silent = true,
      },
      signature = {
        enabled = true,
      },
      -- Shared defaults for hover and signature
      documentation = {
        view = "hover",
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = { concealcursor = "n", conceallevel = 3 },
        },
      },
    },
    notify = {
      enabled = false,
    },
    cmdline = {
      view = "cmdline",
    },
    presets = {
      bottom_search = true,
      lsp_doc_border = true,
    },
    views = {
      hover = {
        border = {
          style = "single",
          padding = { 0, 0 },
        },
        position = { row = 2, col = 0 },
      },
    },
  },
}

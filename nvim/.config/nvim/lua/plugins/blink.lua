return {
  {
    "saghen/blink.cmp",
    enabled = false,
    opts = {
      windows = {
        ghost_text = {
          enabled = false,
        },
      },

      trigger = { signature_help = { enabled = true } },
      sources = {
        completion = {
          enabled_providers = { "snippets", "lsp", "path", "buffer" },
        },
      },
    },
  },
}

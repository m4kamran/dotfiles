return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      java = { "palantir" },
    },
    formatters = {
      palantir = {
        command = "java",
        args = { "-jar", vim.fn.expand("~/.local/share/palantir-java-format.jar"), "--palantir", "-" },
        stdin = true,
      },
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },
  },
}

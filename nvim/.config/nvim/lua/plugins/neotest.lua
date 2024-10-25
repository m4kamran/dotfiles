return {
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = { "neotest-jest" },
      output = { open_on_run = false },
      diagnostic = { enable = false },
      status = {
        enabled = true,
        signs = true,
        virtual_text = false,
      },
    },
  },
}

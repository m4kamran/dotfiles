return {
  {
    "saghen/blink.compat",
    version = "2.*",
    lazy = true,
    opts = {},
  },
  {
    "ThePrimeagen/99",
    dependencies = { "saghen/blink.compat" },
    config = function()
      local _99 = require("99")

      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)

      _99.setup({
        logger = {
          level = _99.DEBUG,
          type = "file",
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        completion = {
          source = "blink",
        },
        md_files = {
          "AGENT.md",
        },
      })

      vim.keymap.set("v", "<leader>9v", function()
        _99.visual()
      end, { desc = "99 Visual" })

      vim.keymap.set("n", "<leader>9x", function()
        _99.stop_all_requests()
      end, { desc = "99 Stop All" })

      vim.keymap.set("n", "<leader>9s", function()
        _99.search()
      end, { desc = "99 Search" })

      vim.keymap.set("n", "<leader>9o", function()
        _99.open()
      end, { desc = "99 Open Last" })

      vim.keymap.set("n", "<leader>9l", function()
        _99.view_logs()
      end, { desc = "99 View Logs" })

      vim.keymap.set("n", "<leader>9c", function()
        _99.clear_previous_requests()
      end, { desc = "99 Clear Requests" })
    end,
  },
}

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "yarn test",
        jestConfigFile = "jest.config.js",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
      ["neotest-vitest"] = {
        vitestCommand = "yarn test",
        env = { CI = true },
        cwd = function(file)
          return require("neotest.lib").files.match_root_pattern(
            "package.json",
            "vite.config.js",
            "vite.config.ts",
            "vitest.config.js",
            "vitest.config.ts"
          )(file)
        end,
      },
    },
    -- Example for loading neotest-golang with a custom config
    -- adapters = {
    --   ["neotest-golang"] = {
    --     go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
    --     dap_go_enabled = true,
    --   },
    -- },
    status = { virtual_text = true },
    output = { open_on_run = false },
    summary = {
      animated = true,
      enabled = true,
      expand_errors = true,
      follow = true,
      mappings = {
        attach = "a",
        clear_marked = "M",
        clear_target = "T",
        debug = "d",
        debug_marked = "D",
        expand = { "<CR>", "<2-LeftMouse>" },
        expand_all = "e",
        jumpto = "i",
        mark = "m",
        next_failed = "J",
        output = "o",
        prev_failed = "K",
        run = "r",
        run_marked = "R",
        short = "O",
        stop = "u",
        target = "t",
        watch = "w",
      },
    },
    quickfix = {
      enabled = true,
      open = function()
        if LazyVim.has("trouble.nvim") then
          require("trouble").open({ mode = "quickfix", focus = false })
        else
          vim.cmd("copen")
        end
      end,
    },
    diagnostic = {
      enabled = true,
      severity = vim.diagnostic.severity.ERROR,
    },
  },
}

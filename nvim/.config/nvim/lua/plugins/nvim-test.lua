return {
  "klen/nvim-test",
  enabled = false,
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    -- Create compatibility shim for deprecated ts_utils
    local ts_utils = {}
    ts_utils.get_node_at_cursor = function()
      return vim.treesitter.get_node()
    end
    ts_utils.get_node_text = function(node)
      return vim.treesitter.get_node_text(node, 0)
    end
    -- Map filetype to treesitter language
    ts_utils.ft_to_lang = function(ft)
      local lang = vim.treesitter.language.get_lang(ft)
      return lang or ft
    end
    package.loaded["nvim-treesitter.ts_utils"] = ts_utils

    require("nvim-test").setup({
      run = true, -- run tests (using for debug)
      commands_create = true, -- create commands (TestFile, TestLast, ...)
      filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
      silent = false, -- less notifications
      term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
      termOpts = {
        direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
        width = 120, -- terminal's width (for vertical|float)
        height = 24, -- terminal's height (for horizontal|float)
        go_back = false, -- return focus to original window after executing
        stopinsert = "auto", -- exit from insert mode (true|false|"auto")
        keep_one = true, -- keep only one terminal for testing
      },
      runners = { -- setup tests runners
        javascript = "nvim-test.runners.jest",
        typescript = "nvim-test.runners.jest",
      },
    })
    local function get_test_config()
      if vim.fn.executable("./node_modules/.bin/vitest") == 1 then
        return {
          command = "./node_modules/.bin/vitest",
          args = { "" },
        }
      else
        return {
          command = "yarn",
          args = { "test" },
        }
      end
    end

    local test_config = get_test_config()

    require("nvim-test.runners.jest"):setup({
      command = "yarn",
      args = { "test", "--coverage=false", "--test-path-pattern" },
      env = {},

      file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",
      find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },

      filename_modifier = ":.",
      working_directory = nil,
    })
  end,
}

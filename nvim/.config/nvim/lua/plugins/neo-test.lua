return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
    "rcasia/neotest-java",
  },
  opts = {
    adapters = {
      ["neotest-jest"] = {
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.ts",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      },
      ["neotest-vitest"] = {
        vitestCommand = "npx vitest",
      },
      ["neotest-java"] = {
        junit_jar = nil,
        is_integration_test = function(file_path)
          return file_path:match("IT%.java$")
            or file_path:match("IntegrationTest%.java$")
            or file_path:match("/it/")
            or file_path:match("/integration/")
        end,
      },
    },
    output_panel = {
      open = "botright vsplit | vertical resize 120",
    },
  },
}

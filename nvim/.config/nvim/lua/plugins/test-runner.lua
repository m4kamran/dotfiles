-- Custom test runner using Snacks terminal
-- Supports Jest, Vitest, and JUnit

-- Detect which test framework to use based on project files
local function detect_framework()
  local cwd = vim.fn.getcwd()

  -- Check for Vitest
  if vim.fn.filereadable(cwd .. "/vitest.config.ts") == 1
    or vim.fn.filereadable(cwd .. "/vitest.config.js") == 1
    or vim.fn.filereadable(cwd .. "/vitest.config.mts") == 1
  then
    return "vitest"
  end

  -- Check for Jest
  if vim.fn.filereadable(cwd .. "/jest.config.ts") == 1
    or vim.fn.filereadable(cwd .. "/jest.config.js") == 1
    or vim.fn.filereadable(cwd .. "/jest.config.mjs") == 1
  then
    return "jest"
  end

  -- Check package.json for test script hints
  local package_json = cwd .. "/package.json"
  if vim.fn.filereadable(package_json) == 1 then
    local content = vim.fn.readfile(package_json)
    local json_str = table.concat(content, "\n")
    if json_str:match("vitest") then
      return "vitest"
    elseif json_str:match("jest") then
      return "jest"
    end
  end

  -- Check for Java/JUnit (Maven or Gradle)
  if vim.fn.filereadable(cwd .. "/pom.xml") == 1 then
    return "maven"
  end
  if vim.fn.filereadable(cwd .. "/build.gradle") == 1
    or vim.fn.filereadable(cwd .. "/build.gradle.kts") == 1
  then
    return "gradle"
  end

  return nil
end

-- Check if this is an Angular project
local function is_angular_project()
  local cwd = vim.fn.getcwd()
  return vim.fn.filereadable(cwd .. "/angular.json") == 1
end

-- Find Jest config file
local function find_jest_config()
  local cwd = vim.fn.getcwd()
  local configs = { "jest.config.ts", "jest.config.js", "jest.config.mjs" }
  for _, config in ipairs(configs) do
    if vim.fn.filereadable(cwd .. "/" .. config) == 1 then
      return config
    end
  end
  return nil
end

-- Get the test command for a framework
local function get_test_command(framework, file, test_name)
  local relative_file = vim.fn.fnamemodify(file, ":.")

  if framework == "vitest" then
    if test_name then
      return string.format("npx vitest run %s -t '%s'", relative_file, test_name)
    end
    return string.format("npx vitest run %s", relative_file)
  elseif framework == "jest" then
    local jest_config = find_jest_config()
    local config_flag = jest_config and string.format(" --config=%s", jest_config) or ""
    if test_name then
      return string.format("npx jest %s -t '%s' --coverage=false%s", relative_file, test_name, config_flag)
    end
    return string.format("npx jest %s --coverage=false%s", relative_file, config_flag)
  elseif framework == "maven" then
    local class_name = vim.fn.fnamemodify(file, ":t:r")
    -- Skip compilation with -DskipCompile, use surefire directly, minimal output
    local base_cmd = "mvn surefire:test -DfailIfNoTests=false -Dsurefire.useFile=false"
    if test_name then
      return string.format("%s -Dtest=%s#%s", base_cmd, class_name, test_name)
    end
    return string.format("%s -Dtest=%s", base_cmd, class_name)
  elseif framework == "gradle" then
    local class_name = vim.fn.fnamemodify(file, ":t:r")
    if test_name then
      return string.format("./gradlew test --tests '%s.%s' --console=plain -x compileJava -x compileTestJava", class_name, test_name)
    end
    return string.format("./gradlew test --tests '%s' --console=plain -x compileJava -x compileTestJava", class_name)
  end

  return nil
end

-- Find the nearest test name using treesitter
local function find_nearest_test()
  local filetype = vim.bo.filetype
  local node = vim.treesitter.get_node()

  if not node then
    return nil
  end

  -- Walk up the tree to find a test function/method
  while node do
    local node_type = node:type()

    -- JavaScript/TypeScript: look for test/it/describe calls
    if filetype == "javascript" or filetype == "typescript"
      or filetype == "javascriptreact" or filetype == "typescriptreact"
    then
      if node_type == "call_expression" then
        local func_node = node:field("function")[1]
        if func_node then
          local func_text = vim.treesitter.get_node_text(func_node, 0)
          if func_text == "it" or func_text == "test" or func_text == "describe" then
            -- Get the first argument (test name)
            local args_node = node:field("arguments")[1]
            if args_node and args_node:named_child_count() > 0 then
              local first_arg = args_node:named_child(0)
              if first_arg then
                local test_name = vim.treesitter.get_node_text(first_arg, 0)
                -- Remove quotes
                test_name = test_name:gsub("^['\"`]", ""):gsub("['\"`]$", "")
                return test_name
              end
            end
          end
        end
      end
    end

    -- Java: look for method declaration
    if filetype == "java" then
      if node_type == "method_declaration" then
        -- Get method name
        local name_node = node:field("name")[1]
        if name_node then
          return vim.treesitter.get_node_text(name_node, 0)
        end
      end
    end

    node = node:parent()
  end

  return nil
end

-- Run test in Snacks terminal
local function run_in_terminal(cmd)
  if not cmd then
    vim.notify("Could not determine test command", vim.log.levels.ERROR)
    return
  end

  Snacks.terminal(cmd, {
    cwd = vim.fn.getcwd(),
    interactive = false,
    win = {
      relative = "editor",
      position = "right",
      width = 0.4,
    },
  })
end

-- Run the current test file
local function run_file()
  local file = vim.fn.expand("%:p")
  local framework = detect_framework()

  if not framework then
    vim.notify("Could not detect test framework", vim.log.levels.ERROR)
    return
  end

  local cmd = get_test_command(framework, file, nil)
  vim.notify("Running: " .. cmd, vim.log.levels.INFO)
  run_in_terminal(cmd)
end

-- Run the nearest test
local function run_nearest()
  local file = vim.fn.expand("%:p")
  local framework = detect_framework()

  if not framework then
    vim.notify("Could not detect test framework", vim.log.levels.ERROR)
    return
  end

  local test_name = find_nearest_test()
  if not test_name then
    vim.notify("Could not find test at cursor, running file instead", vim.log.levels.WARN)
  end

  local cmd = get_test_command(framework, file, test_name)
  vim.notify("Running: " .. cmd, vim.log.levels.INFO)
  run_in_terminal(cmd)
end

return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>tt",
        run_file,
        desc = "Run Test File",
      },
      {
        "<leader>tr",
        run_nearest,
        desc = "Run Nearest Test",
      },
    },
  },
}

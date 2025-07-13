-- return {
--   "CopilotC-Nvim/CopilotChat.nvim",
--   opts = function()
--     -- local user = vim.env.USER or "User"
--     -- user = user:sub(1, 1):upper() .. user:sub(2)
--     return {
--       -- auto_insert_mode = true,
--       -- question_header = "  " .. user .. " ",
--       -- answer_header = "  Copilot ",
--       window = {
--         width = 0.4,
--       },
--     }
--   end,
-- }

return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      window = {
        split_ratio = 0.5, -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
        position = "vertical", -- Position of the window: "botright", "topleft", "vertical", "float", etc.
        enter_insert = true, -- Whether to enter insert mode when opening Claude Code
        hide_numbers = true, -- Hide line numbers in the terminal window
        hide_signcolumn = true, -- Hide the sign column in the terminal window
      },
    })
  end,
}

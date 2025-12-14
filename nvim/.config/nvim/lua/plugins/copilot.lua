return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      -- suggestion = {
      -- enabled = true,
      -- auto_trigger = true,

      -- keymap = {
      --   accept = "<C-l>", -- handled by nvim-cmp / blink.cmp
      -- },
      -- },
      --
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        hide_during_completion = vim.g.ai_cmp,
        keymap = {
          accept = "<C-l>", -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
    keys = {
      {
        "<leader>at",
        function()
          if require("copilot.client").is_disabled() then
            require("copilot.command").enable()
          else
            require("copilot.command").disable()
          end
        end,
        desc = "Toggle (Copilot)",
      },
    },
    -- config = function(_, opts)
    --   require("copilot").setup(opts)
    --   -- Add custom keymap that checks for suggestion
    --   vim.keymap.set("i", "<Tab>", function()
    --     if require("copilot.suggestion").is_visible() then
    --       require("copilot.suggestion").accept()
    --     else
    --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    --     end
    --   end, { desc = "Super Tab" })
    -- end,
  },

  -- Disable Copilot status in lualine
  {
    "AndreM222/copilot-lualine",
    enabled = false,
  },

  -- add this to the file where you setup your other plugins:
  -- {
  --   "copilotlsp-nvim/copilot-lsp",
  --   branch = "main",
  --   init = function()
  --     vim.g.copilot_nes_debounce = 500
  --     vim.lsp.enable("copilot")
  --     vim.keymap.set("n", "<tab>", function()
  --       require("copilot-lsp.nes").apply_pending_nes()
  --     end)
  --   end,
  -- },
}

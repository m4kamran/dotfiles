return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      win = {
        split = {
          width = 0.4, -- increased from default 80
        },
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if require("sidekick").nes_jump_or_apply() then
          return
        end

        if #vim.fn.getqflist() > 0 then
          if not pcall(vim.cmd.cnext) then
            vim.cmd.cfirst()
          end
          return
        end

        vim.api.nvim_feedkeys(vim.keycode("<C-i>"), "n", false)
      end,
      silent = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<S-Tab>",
      function()
        if #vim.fn.getqflist() == 0 then
          return
        end

        if not pcall(vim.cmd.cprev) then
          vim.cmd.clast()
        end
      end,
      silent = true,
      desc = "Previous Quickfix Item",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").toggle({ name = "opencode", focus = true })
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle({ focus = true })
      end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "v" },
    },
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Sidekick Claude Toggle",
      mode = { "n", "v" },
    },
    {
      "<leader>ag",
      function()
        require("sidekick.cli").toggle({ name = "grok", focus = true })
      end,
      desc = "Sidekick Grok Toggle",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      desc = "Sidekick Ask Prompt",
      mode = { "n", "v" },
    },
  },
}

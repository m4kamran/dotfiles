local function toggle_opencode()
  local commands = require("opencode.commands")
  local state = require("opencode.state")

  if state.windows or state.ui.has_hidden_buffers() then
    return commands.execute_parsed_intent(commands.build_parsed_intent("toggle"))
  end

  return commands.execute_parsed_intent(commands.build_parsed_intent("open_input"))
end

return {
  {
    "sudo-tee/opencode.nvim",
    enabled = false,
    opts = {
      keymap = {
        editor = {
          ["<C-.>"] = {
            toggle_opencode,
            mode = { "n", "x", "i", "t" },
            desc = "Opencode Toggle",
          },
          ["<leader>aa"] = {
            toggle_opencode,
            mode = { "n", "v" },
            desc = "Opencode Toggle",
          },
          ["<leader>ap"] = {
            "open_input",
            mode = { "n", "v" },
            desc = "Opencode Ask Prompt",
          },
          ["<leader>at"] = {
            "add_visual_selection",
            mode = { "x" },
            desc = "Opencode Send Selection",
          },
        },
      },
      ui = {
        display_model = false,
        display_context_size = false,
        display_cost = false,
        icons = {
          preset = "text",
        },
        output = {
          compact_assistant_headers = "minimal",
          tools = {
            show_output = false,
            show_reasoning_output = false,
          },
        },
      },
    },
    config = function(_, opts)
      require("opencode").setup(opts)

      -- Ghostty sends `<Esc><CR>` for Shift+Enter (see ghostty config:
      -- `keybind = shift+enter=text:\x1b\r`). In insert mode this exits to
      -- normal mode before opencode.nvim can see `<S-CR>`. Remap the combined
      -- sequence in the opencode input buffer so Shift+Enter inserts a newline
      -- instead of submitting / leaving insert mode.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "opencode",
        group = vim.api.nvim_create_augroup("opencode_shift_enter", { clear = true }),
        callback = function(ev)
          vim.keymap.set("i", "<Esc><CR>", "<CR>", {
            buffer = ev.buf,
            silent = true,
            desc = "Shift+Enter: newline (ghostty sends Esc+CR)",
          })
        end,
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = true },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
      },
      -- Optional, for file mentions and commands completion, pick only one
      "saghen/blink.cmp",
      -- 'hrsh7th/nvim-cmp',

      -- Optional, for file mentions picker, pick only one
      "folke/snacks.nvim",
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim_mini/mini.nvim',
    },
  },
}

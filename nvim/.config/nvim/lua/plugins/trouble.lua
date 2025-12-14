return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      indent_guides = false, -- show indent guides
      auto_refresh = false, -- don't auto-update as cursor moves
      follow = false, -- don't follow cursor position
      win = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.4,
      },
    },
    keys = {
      {
        "<leader>cSS",
        "<cmd>Trouble lsp toggle auto_jump=false<cr>",
        desc = "LSP references/definitions/... (Trouble)",
      },
      { "<leader>cSr", "<cmd>Trouble lsp_references toggle auto_jump=false<cr>", desc = "References (Trouble)" },
      {
        "<leader>cSi",
        "<cmd>Trouble lsp_implementations toggle auto_jump=false<cr>",
        desc = "Implementations (Trouble)",
      },
      { "<leader>cSd", "<cmd>Trouble lsp_definitions toggle auto_jump=false<cr>", desc = "Definitions (Trouble)" },
      {
        "<leader>cSt",
        "<cmd>Trouble lsp_type_definitions toggle auto_jump=false<cr>",
        desc = "Type Definitions (Trouble)",
      },
      {
        "<leader>cSI",
        "<cmd>Trouble lsp_incoming_calls toggle auto_jump=false<cr>",
        desc = "Incoming Calls (Trouble)",
      },
      {
        "<leader>cSO",
        "<cmd>Trouble lsp_outgoing_calls toggle auto_jump=false<cr>",
        desc = "Outgoing Calls (Trouble)",
      },
    },
  },
}

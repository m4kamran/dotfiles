return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      indent_guides = false, -- show indent guides
      auto_refresh = false, -- don't auto-update as cursor moves
      follow = false, -- don't follow cursor position
      modes = {
        lsp_filtered = {
          mode = "lsp",
          filter = function(items)
            local locations = {}
            for _, item in ipairs(items) do
              local current_location = item.filename .. item.pos[1]
              local existing = locations[current_location]
              if not existing or existing.pos[2] > item.pos[2] then
                locations[current_location] = item
              end
            end
            return vim.tbl_values(locations)
          end,
        },
        lsp_references_filtered = {
          mode = "lsp_references",
          filter = function(items)
            local locations = {}
            for _, item in ipairs(items) do
              local current_location = item.filename .. item.pos[1]
              local existing = locations[current_location]
              if not existing or existing.pos[2] > item.pos[2] then
                locations[current_location] = item
              end
            end
            return vim.tbl_values(locations)
          end,
        },
      },
      win = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.5,
      },
    },
    keys = {
      {
        "<leader>cSS",
        "<cmd>Trouble lsp_filtered toggle auto_jump=false<cr>",
        desc = "LSP references/definitions/... (Trouble)",
      },
      {
        "<leader>cSr",
        "<cmd>Trouble lsp_references_filtered toggle auto_jump=false<cr>",
        desc = "References (Trouble)",
      },
      { "gR", "<cmd>Trouble lsp_references_filtered toggle auto_jump=false<cr>", desc = "References (Trouble)" },
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

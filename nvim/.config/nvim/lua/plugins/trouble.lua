return {
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
      indent_guides = false, -- show indent guides
      auto_refresh = false, -- don't auto-update as cursor moves
      follow = false, -- don't follow cursor position
      modes = {
        -- Filtered modes to deduplicate results from multiple LSP servers (vtsls + angularls)
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
        lsp_definitions_filtered = {
          mode = "lsp_definitions",
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
        lsp_implementations_filtered = {
          mode = "lsp_implementations",
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
        lsp_type_definitions_filtered = {
          mode = "lsp_type_definitions",
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
        "<leader>cS",
        "<cmd>Trouble lsp_filtered toggle auto_jump=false<cr>",
        desc = "LSP references/definitions/... (Trouble)",
      },
    },
  },
}

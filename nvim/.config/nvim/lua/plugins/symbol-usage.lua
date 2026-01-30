-- return {
--   "Wansmer/symbol-usage.nvim",
--   event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
--   opts = {
--     vt_position = "end_of_line", -- position of virtual text, can be 'eol' or 'inline'
--   },
-- }

return {
  {
    "romus204/referencer.nvim",
    config = function()
      require("referencer").setup({
        enable = true, -- enable after LSP attach
        format = " %d usages", -- format string for reference count
        show_no_reference = true, -- show if refs count = 0
        kinds = { 12, 6, 5, 23, 8 },
        hl_group = "Comment", -- default highlight group
        color = nil, -- optional custom color (overrides hl_group)
        virt_text_pos = "eol", -- virtual text position (eol | overlay | right_align)
        pattern = nil, -- pattern for LspAttach autocmd to auto-enable
        lsp_servers = {}, -- list of servers for which this plugin will be active. nil or {} is ALL LSP clients
      })
    end,
  },
}

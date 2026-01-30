return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local custom_theme = require("lualine.themes.iceberg_dark")
    -- Remove background colors from b and c sections only, keep a (mode) colored
    for _, mode in pairs(custom_theme) do
      if mode.b then
        mode.b.bg = "NONE"
      end
      if mode.c then
        mode.c.bg = "NONE"
      end
    end
    return {
      options = {
        theme = custom_theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_x = {},
      },
    }
  end,
}

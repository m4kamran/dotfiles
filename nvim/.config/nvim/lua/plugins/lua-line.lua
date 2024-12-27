local noice = require("noice")

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = false,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      -- ignore_focus = {},
      -- always_divide_middle = true,
      -- always_show_tabline = true,
      -- globalstatus = false,
      -- refresh = {
      --   statusline = 10,
      --   tabline = 10,
      --   winbar = 10,
      -- },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",

        {
          noice.api.status.mode.get,
          cond = noice.api.status.mode.has,
          color = { fg = "#FFFFFF" },
        },
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}

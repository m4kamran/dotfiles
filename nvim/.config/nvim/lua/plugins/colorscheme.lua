local base = {
  red = "#ff657a",
  maroon = "#F29BA7",
  peach = "#ff9b5e",
  yellow = "#eccc81",
  green = "#a8be81",
  teal = "#9cd1bb",
  sky = "#A6C9E5",
  sapphire = "#86AACC",
  blue = "#5d81ab",
  lavender = "#66729C",
  mauve = "#b18eab",
}

local extend_base = function(value)
  return vim.tbl_extend("force", base, value)
end

return {
  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        color_overrides = {
          frappe = extend_base({
            rosewater = "#e29eca",
            flamingo = "#e8b0d4",
            pink = "#ea83a5",
            mauve = "#aca1cf",
            red = "#ea83a5",
            maroon = "#ed96b3",
            peach = "#f5a191",
            yellow = "#e6b99d",
            green = "#90b99f",
            teal = "#85b5ba",
            sky = "#97c0c4",
            sapphire = "#97c0c4",
            blue = "#92a2d5",
            lavender = "#b7aed5",
            text = "#c9c7cd",
            subtext1 = "#b4b1ba",
            subtext0 = "#9f9ca6",
            overlay2 = "#8b8693",
            overlay1 = "#6c6874",
            overlay0 = "#444448",
            surface2 = "#3b3b3e",
            surface1 = "#313134",
            surface0 = "#2a2a2c",
            base = "#161617",
            mantle = "#131314",
            crust = "#18181a",
          }),
        },
        no_italic = true, -- Force no italic
        no_bold = true, -- Force no bold
        transparent_background = true,
        custom_highlights = function(c)
          return {
            NeoTreeDirectoryName = { fg = c.lavender },
            NeoTreeDirectoryIcon = { fg = c.yellow },
            NeoTreeWinSeparator = { fg = "#1a1a1a", bg = "#000000" },
            FloatBorder = { fg = "#1a1a1a", bg = "#000000" },
            WinBar = { fg = c.overlay2, bg = "NONE" },
            WinBarNC = { fg = c.overlay2, bg = "NONE" },
          }
        end,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe", -- Set your preferred colorscheme here
    },
  },
}

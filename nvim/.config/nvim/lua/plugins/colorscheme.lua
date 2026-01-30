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
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_float_style = "blend"

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
        pattern = "gruvbox-material",
        callback = function()
          local config = vim.fn["gruvbox_material#get_configuration"]()
          local palette =
            vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
          local set_hl = vim.fn["gruvbox_material#highlight"]

          set_hl("NeoTreeDirectoryName", palette.blue, palette.none)
          set_hl("NeoTreeDirectoryIcon", palette.yellow, palette.none)
          set_hl("NeoTreeWinSeparator", palette.bg_dim, palette.none)
          set_hl("FloatBorder", palette.bg_dim, palette.none)
          set_hl("WinBar", palette.grey1, palette.none)
          set_hl("WinBarNC", palette.grey0, palette.none)
        end,
      })
    end,
  },

  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        -- This callback can be used to override the colors used in the base palette.
        on_palette = function(palette) end,
        -- This callback can be used to override the colors used in the extended palette.
        after_palette = function(palette) end,
        -- This callback can be used to override highlights before they are applied.
        on_highlight = function(highlights, palette) end,
        -- Enable bold keywords.
        bold_keywords = false,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable editor background transparency.
        transparent = {
          -- Enable transparent background.
          bg = true,
          -- Enable transparent background for floating windows.
          float = true,
        },
        -- Enable brighter float border.
        bright_border = false,
        -- Reduce the overall amount of blue in the theme (diverges from base Nord).
        reduced_blue = true,
        -- Swap the dark background with the normal one.
        swap_backgrounds = false,
        -- Cursorline options.  Also includes visual/selection.
        cursorline = {
          -- Bold font in cursorline.
          bold = false,
          -- Bold cursorline number.
          bold_number = true,
          -- Available styles: 'dark', 'light'.
          theme = "dark",
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.85,
        },
        noice = {
          -- Available styles: `classic`, `flat`.
          style = "flat",
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = "flat",
        },
        leap = {
          -- Dims the backdrop when using leap.
          dim_backdrop = false,
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        },
      })
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            NeoTreeWinSeparator = { fg = theme.ui.bg_dim, bg = "none" },
            WinBar = { fg = theme.ui.special, bg = "none" },
            WinBarNC = { fg = theme.ui.special, bg = "none" },
          }
        end,
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa", -- Set your preferred colorscheme here
    },
  },
}

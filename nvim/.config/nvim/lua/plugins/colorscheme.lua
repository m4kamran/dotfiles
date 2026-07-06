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

local mocha = extend_base({
  rosewater = "#ea83a5",
  flamingo = "#ed96b3",
  pink = "#f2a7c5",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
})

local pastel_diff = {
  add = { fg = "#b8e3c6", bg = "#2c3d35" },
  delete = { fg = "#f0c1cc", bg = "#433039" },
  change = { fg = "#b7cdfa", bg = "#2e384d" },
  text = { fg = "#dfc3f7", bg = "#433b56" },
  text_add = { fg = "#c8ebd1", bg = "#365044" },
  add_as_delete = { fg = "#e6b4c0", bg = "#3a2931" },
  deleted = { fg = "#7d7888", bg = "NONE" },
}

return {
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   opts = {
  --     transparent = true,
  --     theme_variant = "dawn",
  --   },
  -- },
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
          mocha = mocha,
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
            -- Global diff highlights (used outside diffview, e.g. :diffsplit, gitsigns)
            DiffAdd = pastel_diff.add,
            DiffDelete = pastel_diff.delete,
            DiffChange = pastel_diff.change,
            DiffText = pastel_diff.text,
            DiffTextAdd = pastel_diff.text_add,

            -- Diffview: known groups (created by diffview's hl.lua)
            DiffviewDiffAddAsDelete = pastel_diff.add_as_delete,
            DiffviewDiffDelete = pastel_diff.deleted,
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
            -- Cursor colors per mode
            CursorInsert = { bg = "#98bb6c", fg = theme.ui.bg },
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
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        transparent = true,
        integrations = {
          neo_tree = true,
        },
        highlight_overrides = {
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          SignColumn = { bg = "none" },
          EndOfBuffer = { bg = "none" },
          NeoTreeNormal = { bg = "none" },
          NeoTreeNormalNC = { bg = "none" },
        },
      })
    end,
  },

  {
    "topazape/oldtale.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldtale").setup({
        highlight_overrides = {
          Normal = { bg = "none" },
          NormalNC = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          SignColumn = { bg = "none" },
          EndOfBuffer = { bg = "none" },
          Winbar = { bg = "none" },
          WinbarNC = { bg = "none" },
        },
      })
    end,
  },

  {
    "ember-theme/nvim",
    name = "ember",
    lazy = false,
    priority = 1000,
    config = function()
      require("ember").setup({
        variant = "ember", -- "ember" | "ember-soft" | "ember-light"
        styles = {
          comments = { italic = true },
          keywords = { bold = false },
          functions = {},
          types = { bold = false },
        },
        on_highlights = function(highlights, theme)
          -- Transparent backgrounds
          highlights.Normal = { fg = highlights.Normal and highlights.Normal.fg, bg = "NONE" }
          highlights.NormalNC = { fg = highlights.Normal and highlights.Normal.fg, bg = "NONE" }
          highlights.NormalFloat = { fg = highlights.Normal and highlights.Normal.fg, bg = "NONE" }
          highlights.FloatBorder = { fg = "#1a1a1a", bg = "NONE" }
          highlights.FloatTitle = vim.tbl_extend("force", highlights.FloatTitle or {}, { bg = "NONE" })
          highlights.SignColumn = { bg = "NONE" }
          highlights.EndOfBuffer = { bg = "NONE" }

          -- NeoTree
          highlights.NeoTreeNormal = { bg = "NONE" }
          highlights.NeoTreeNormalNC = { bg = "NONE" }
          highlights.NeoTreeWinSeparator = { fg = "#1a1a1a", bg = "NONE" }

          -- WinBar
          highlights.WinBar = vim.tbl_extend("force", highlights.WinBar or {}, { bg = "NONE" })
          highlights.WinBarNC = vim.tbl_extend("force", highlights.WinBarNC or {}, { bg = "NONE" })

          -- Snacks picker — strip backgrounds for transparency
          local picker_bg_groups = {
            "SnacksPicker",
            "SnacksPickerBorder",
            "SnacksPickerInput",
            "SnacksPickerInputBorder",
            "SnacksPickerList",
            "SnacksPickerListBorder",
            "SnacksPickerPreview",
            "SnacksPickerPreviewBorder",
            "SnacksPickerBox",
          }
          for _, group in ipairs(picker_bg_groups) do
            if highlights[group] then
              highlights[group] = vim.tbl_extend("force", highlights[group], { bg = "NONE" })
            end
          end

          -- Global diff highlights (matching catppuccin pastel_diff)
          highlights.DiffAdd = pastel_diff.add
          highlights.DiffDelete = pastel_diff.delete
          highlights.DiffChange = pastel_diff.change
          highlights.DiffText = pastel_diff.text
          highlights.DiffTextAdd = pastel_diff.text_add

          -- Diffview: known groups (created by diffview's hl.lua)
          highlights.DiffviewDiffAddAsDelete = pastel_diff.add_as_delete
          highlights.DiffviewDiffDelete = pastel_diff.deleted
        end,
      })
    end,
  },

  {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italics = true,
      bold = false,
      flat_ui = true, -- toggles "flat UI" for pickers
      background = {
        dark = "jellybeans", -- default dark palette
        light = "jellybeans_light", -- default light palette
      },
      plugins = {
        all = false,
        auto = true, -- auto-detect installed plugins via lazy.nvim
      },
      on_highlights = function(highlights, colors) end,
      on_colors = function(colors) end,
    },
  },

  {
    "zitrocode/carvion.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require("carvion").setup(opts)

      -- carvion doesn't expose an override hook, so patch highlights after it loads.
      local apply_carvion_highlights = function()
        local colors = require("carvion.colors")

        for group, hl in pairs({
          NormalFloat = { fg = colors.fg.default, bg = "NONE" },
          FloatBorder = { fg = colors.border.subtle, bg = "NONE" },
          FloatTitle = { fg = colors.colors.orange.base, bg = "NONE", bold = true },
          NeoTreeDirectoryName = { fg = colors.colors.blue.base },
          NeoTreeDirectoryIcon = { fg = colors.colors.orange.soft },
          NeoTreeWinSeparator = { fg = colors.border.subtle, bg = "NONE" },
          WinBar = { fg = colors.colors.orange.soft, bg = "NONE" },
          WinBarNC = { fg = colors.colors.orange.soft, bg = "NONE" },
          -- Global diff highlights (used outside diffview, e.g. :diffsplit, gitsigns)
          DiffAdd = pastel_diff.add,
          DiffDelete = pastel_diff.delete,
          DiffChange = pastel_diff.change,
          DiffText = pastel_diff.text,
          DiffTextAdd = pastel_diff.text_add,
          -- Diffview: known groups (created by diffview's hl.lua)
          DiffviewDiffAddAsDelete = pastel_diff.add_as_delete,
          DiffviewDiffDelete = pastel_diff.deleted,
        }) do
          vim.api.nvim_set_hl(0, group, hl)
        end
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("custom_highlights_carvion", {}),
        pattern = "carvion",
        callback = apply_carvion_highlights,
      })

      if vim.g.colors_name == "carvion" then
        apply_carvion_highlights()
      end
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa", -- Set your preferred colorscheme here
    },
  },
}

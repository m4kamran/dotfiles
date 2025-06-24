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
          bold_number = false,
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
          style = "classic",
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
    config = function()
      require("kanagawa").setup({
        compile = true, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_dim },
            TelescopePromptBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
            TelescopeResultsBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            NeoTreeDirectoryIcon = { fg = colors.palette.oldWhite },
            RenderMarkdownCode = { bg = "none", fg = "none" },
            RenderMarkdownCodeInline = { bg = "none", fg = "none" },
            ColorColumn = { bg = "#000000" },
            LineNr = { fg = "#000000", bg = "#000000" },
            NonText = { fg = "#000000", bg = "#000000" },
          }
        end,
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
                float = {
                  bg = "none",
                },
              },
            },
          },
        },
      })
    end,
  },

  { "rose-pine/neovim", name = "rose-pine", opts = {
    styles = {
      transparent = true,
    },
  } },

  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      require("catppuccin").setup({
        -- background = {
        --   dark = "frappe",
        --   light = "latte",
        -- },
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
          mocha = extend_base({
            rosewater = "#D8DEE9",
            flamingo = "#E5E9F0",
            pink = "#B48EAD",
            mauve = "#B48EAD",
            red = "#BF616A",
            maroon = "#B74E58",
            peach = "#D08770",
            yellow = "#EBCB8B",
            green = "#A3BE8C",
            teal = "#8FBCBB",
            sky = "#88C0D0",
            sapphire = "#81A1C1",
            blue = "#5E81AC",
            lavender = "#B48EAD",
            text = "#ECEFF4",
            subtext1 = "#E5E9F0",
            subtext0 = "#D8DEE9",
            overlay2 = "#BBC3D4",
            overlay1 = "#4C566A",
            overlay0 = "#434C5E",
            surface2 = "#3B4252",
            surface1 = "#2E3440",
            surface0 = "#242933",
            base = "#191D24",
            mantle = "#1E222A",
            crust = "#222630",
          }),
        },
        no_italic = true, -- Force no italic
        no_bold = true, -- Force no bold
        transparent_background = true,
        custom_highlights = function(c)
          return {
            NeoTreeDirectoryName = { fg = c.lavender },
            NeoTreeDirectoryIcon = { fg = c.yellow },
          }
        end,
      })
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })
    end,
  },

  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local lackluster = require("lackluster")
      require("nvim-web-devicons").setup({
        color_icons = false,
        override = {
          ["default_icon"] = {
            color = lackluster.color.gray4,
            name = "Default",
          },
        },
        tweak_background = {
          normal = "#000000",
          telescope = "none",
          menu = lackluster.color.gray3,
          popup = "default",
        },
      })
    end,
  },

  {
    "aliqyan-21/darkvoid.nvim",
    opts = {
      transparent = true, -- set true for transparent
      glow = true, -- set true for glow effect
    },
  },

  {
    "shaunsingh/nord.nvim",
    config = function()
      -- Example config in lua
      vim.g.nord_contrast = false
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },

  {
    "mellow-theme/mellow.nvim",
    config = function()
      local c = require("mellow.colors")["dark"]
      vim.g.mellow_transparent = true

      vim.g.mellow_highlight_overrides = {
        NeoTreeDirectoryName = { fg = c.white },
        -- DiffAdd = { fg = "#000000", bg = c.green },
        -- DiffDelete = { fg = "#000000", bg = c.red },
        NormalFloat = { bg = "#121212" },
        TelescopePromptNormal = { bg = "#121212" },
        TelescopePromptBorder = { fg = "#121212", bg = "#121212" },
        TelescopeResultsNormal = { fg = c.white, bg = "#121212" },
        TelescopeResultsBorder = { fg = "#121212", bg = "#121212" },
        TelescopePreviewNormal = { bg = "#121212" },
        TelescopePreviewBorder = { bg = "#121212", fg = "#121212" },

        DiffAdd = { bg = c.green, fg = c.black },
        -- DiffChange	Diff mode: Changed line. |diff.txt|
        DiffChange = { bg = c.blue, fg = c.black },
        -- DiffDelete	Diff mode: Deleted line. |diff.txt|
        DiffDelete = { fg = c.black, bg = c.red },
        -- DiffText	Diff mode: Changed text within a changed line. |diff.txt|
        DiffText = { bg = c.yellow, fg = c.black },

        -- TelescopePromptNormal = { bg = theme.ui.bg_dim },
        -- TelescopePromptBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
        -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim },
        -- TelescopeResultsBorder = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
        -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      }
    end,
  },

  {
    "ramojus/mellifluous.nvim",
    config = function()
      require("mellifluous").setup({
        dim_inactive = false,
        colorset = "kanagawa_dragon",
        styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
          main_keywords = {},
          other_keywords = {},
          types = {},
          operators = {},
          strings = {},
          functions = {},
          constants = {},
          comments = { italic = true },
          markup = {
            headings = { bold = true },
          },
          folds = {},
        },
        transparent_background = {
          enabled = true,
          floating_windows = true,
          telescope = true,
          file_tree = true,
          cursor_line = true,
          status_line = false,
        },
        flat_background = {
          line_numbers = false,
          floating_windows = false,
          file_tree = false,
          cursor_line_number = false,
        },
        plugins = {
          cmp = true,
          gitsigns = true,
          indent_blankline = true,
          nvim_tree = {
            enabled = true,
            show_root = false,
          },
          neo_tree = {
            enabled = true,
          },
          telescope = {
            enabled = true,
            nvchad_like = true,
          },
          startify = true,
        },
      })
    end,
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { transparent = true, style = "night" },
  },

  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({

        contrast = {
          terminal = false, -- Enable contrast for the built-in terminal
          sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = false, -- Enable contrast for floating windows
          cursor_line = false, -- Enable darker background for the cursor line
          lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
          non_current_windows = false, -- Enable contrasted background for non-current windows
          filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },

        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { --[[ italic = true ]]
          },
          strings = { --[[ bold = true ]]
          },
          keywords = { --[[ underline = true ]]
          },
          functions = { --[[ bold = true, undercurl = true ]]
          },
          variables = {},
          operators = {},
          types = {},
        },

        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          -- "coc",
          -- "colorful-winsep",
          -- "dap",
          "dashboard",
          -- "eyeliner",
          -- "fidget",
          -- "flash",
          -- "gitsigns",
          "harpoon",
          -- "hop",
          -- "illuminate",
          -- "indent-blankline",
          -- "lspsaga",
          "mini",
          -- "neogit",
          "neotest",
          "neo-tree",
          "neorg",
          "noice",
          "nvim-cmp",
          -- "nvim-navic",
          -- "nvim-tree",
          "nvim-web-devicons",
          -- "rainbow-delimiters",
          -- "sneak",
          "telescope",
          "trouble",
          "which-key",
          "nvim-notify",
        },

        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = false, -- Disable borders between vertically split windows
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false, -- Enable higher contrast text for darker style
        },

        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)

        custom_colors = nil, -- If you want to override the default colors, set this to a function

        custom_highlights = {}, -- Overwrite highlights with your own
      })
    end,
  },

  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        disable_background = true, -- disable background
      })
    end,
  },

  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      -- overrides = function(colors)
      --   local theme = colors.theme
      --   return {
      --     -- NormalFloat = { bg = "none" },
      --     -- FloatBorder = { bg = "none" },
      --     -- FloatTitle = { bg = "none" },
      --     --
      --     -- -- Save a hlgroup with dark background and dimmed foreground
      --     -- -- so that you can use it where you still want darker windows.
      --     -- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
      --     -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      --     --
      --     -- -- Popular plugins that open floats will link to NormalFloat by default;
      --     -- -- set their background accordingly if you wish to keep them dark and borderless
      --     -- LazyNormal = { bg = "none", fg = theme.ui.fg_dim },
      --     -- MasonNormal = { bg = "none", fg = theme.ui.fg_dim },
      --
      --     -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
      --     -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      --     -- PmenuSbar = { bg = theme.ui.bg_m1 },
      --     -- PmenuThumb = { bg = theme.ui.bg_p2 },
      --     --
      --     -- NeoTreeDirectoryIcon = { fg = theme.ui.fg_dim },
      --     --
      --     -- TelescopeResultsNormal = { bg = "None" },
      --   }
      -- end,
    },
  },

  {
    "aktersnurra/no-clown-fiesta.nvim",
    priority = 1000,
    config = function()
      local plugin = require("no-clown-fiesta")
      plugin.setup({})
    end,
  },

  { "datsfilipe/vesper.nvim" },

  {
    "oahlen/iceberg.nvim",
  },

  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("oldworld").setup({
        -- your settings here
        variant = "oled",
        highlight_overrides = {
          diffAdded = { fg = "#a6e3a1" },
          diffRemoved = { fg = "#f38ba8" },
          diffChanged = { fg = "#89b4fa" },
          diffOldFile = { fg = "#f9e2af" },
          diffNewFile = { fg = "#fab387" },
          diffFile = { fg = "#89b4fa" },
          diffLine = { fg = "#6c7086" },
          diffIndexLine = { fg = "#94e2d5" },

          -- DiffAdd = { bg = U.darken(C.green, 0.18, C.base) }, -- diff mode: Added line |diff.txt|
          -- DiffChange = { bg = U.darken(C.blue, 0.07, C.base) }, -- diff mode: Changed line |diff.txt|
          -- DiffDelete = { bg = U.darken(C.red, 0.18, C.base) }, -- diff mode: Deleted line |diff.txt|
          -- DiffText = { bg = U.darken(C.blue, 0.30, C.base) }, -- diff mode: Changed text within a changed line |diff.txt|
        },
      })
    end,
  },

  {
    "Vallen217/eidolon.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    "ficcdaf/ashen.nvim",
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        transparent = true,
        -- optional configuration here
      })
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  -- {
  --   "wtfox/jellybeans.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("jellybeans").setup({
  --       style = "dark", -- "dark" or "light"
  --       transparent = true,
  --       italics = false,
  --       flat_ui = false, -- toggles "flat UI" for pickers
  --       plugins = {
  --         all = false,
  --         auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
  --       },
  --       on_highlights = function(highlights, colors) end,
  --       on_colors = function(colors) end,
  --     })
  --   end,
  -- },

  -- {
  --   "wheat-thin-wiens/rei.nvim",
  --   priority = 1000,
  --   branch = "dev",
  --   opts = {
  --     transparency = true,
  --   },
  -- },
  --
  -- {
  --   "armannikoyan/rusty",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  -- },

  {
    "killitar/obscure.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup({
        italics = true, -- enable italics
        bold = false, -- enable bold text
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = {},
        typeStyle = {},
        disableItalics = false,
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { zen = {}, pearl = {}, ink = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          local theme = colors.theme
          return {
            NormalFloat = { bg = "none" },
          }
        end,
        theme = "zen", -- Load "zen" theme
        background = { -- map the value of 'background' option to a theme
          dark = "zen", -- try "ink" !
          light = "pearl",
        },
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}

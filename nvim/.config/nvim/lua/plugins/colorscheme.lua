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
      transparency = true,
    },
  } },

  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      require("catppuccin").setup({
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
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- NormalFloat = { bg = "none" },
          -- FloatBorder = { bg = "none" },
          -- FloatTitle = { bg = "none" },
          --
          -- -- Save a hlgroup with dark background and dimmed foreground
          -- -- so that you can use it where you still want darker windows.
          -- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          --
          -- -- Popular plugins that open floats will link to NormalFloat by default;
          -- -- set their background accordingly if you wish to keep them dark and borderless
          -- LazyNormal = { bg = "none", fg = theme.ui.fg_dim },
          -- MasonNormal = { bg = "none", fg = theme.ui.fg_dim },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          NeoTreeDirectoryIcon = { fg = theme.ui.fg_dim },

          TelescopeResultsNormal = { bg = "None" },
        }
      end,
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
    "wtfox/jellybeans.nvim",
    priority = 1000,
    opts = {},
  },

  {
    "oahlen/iceberg.nvim",
  },

  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "Yazeed1s/oh-lucy.nvim",
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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}

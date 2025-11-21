return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      hide_root_node = true,
      window = {
        position = "left",
        width = 40,
      },
      default_component_configs = {
        container = {
          enable_character_fade = false,
        },
        indent = {
          with_markers = false,
        },
        file_size = {
          enabled = false,
        },
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
        symlink_target = {
          enabled = false,
        },
      },
    },
  },
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    enabled = false,
    opts = {
      close_on_select = false,
      -- Auto-confirm simple file operations
      confirm_simple = false,
      -- Replace netrw as default explorer
      default_explorer = false,

      -- Git integration
      git_status = {
        enabled = true,
        symbols = {
          Untracked = "?",
          Added = "+",
          Modified = "*",
          Deleted = "x",
          Renamed = ">",
          Copied = "~",
          Conflict = "!",
          Ignored = "#",
        },
      },

      hooks = {
        -- function(path) end
        on_delete = nil,
        -- function(src_path, dst_path) end
        on_rename = nil,
        -- function(hl_groups, palette) end
        on_highlight = nil,
      },

      -- Directory icons
      icon = {
        directory_collapsed = nil,
        directory_empty = nil,
        directory_expanded = nil,
      },

      -- Icon provider (none, mini_icons or nvim_web_devicons)
      icon_provider = "mini_icons",

      -- Indentation guides
      indentscope = {
        enabled = true,
        group = "FylerIndentMarker",
        marker = "│",
      },

      -- Key mappings
      mappings = {
        ["q"] = "CloseView",
        ["<CR>"] = "Select",
        ["<C-t>"] = "SelectTab",
        ["|"] = "SelectVSplit",
        ["-"] = "SelectSplit",
        ["^"] = "GotoParent",
        ["="] = "GotoCwd",
        ["."] = "GotoNode",
        ["#"] = "CollapseAll",
        ["<BS>"] = "CollapseNode",
      },

      popups = {
        permission = {
          -- Respective popup configuration:
          -- border
          -- height
          -- width
          -- left
          -- right
          -- top
          -- bottom
        },
      },

      -- Buffer tracking
      track_current_buffer = true,

      -- Window configuration
      win = {
        -- Window border style
        border = "single",
        -- Default window kind
        kind = "replace",

        -- Window kind presets
        kind_presets = {
          -- Define custom layouts
          -- Values: "(0,1]rel" for relative or "{1...}abs" for absolute
          split_left = { width = "50abs" },
        },

        -- Buffer and window options
        buf_opts = {}, -- Custom buffer options
        win_opts = {}, -- Custom window options
      },
    },
  },
}

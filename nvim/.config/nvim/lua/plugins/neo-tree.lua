return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      hide_root_node = true,
      filesystem = {
        group_empty_dirs = true,
      },
      window = {
        position = "left",
        width = 40,
      },
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 1,
          with_markers = false,
        },
        modified = {
          enabled = false,
        },
        git_status = {
          enabled = false,
        },
        diagnostics = {
          enabled = false,
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
}

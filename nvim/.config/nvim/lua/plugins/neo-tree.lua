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
          enable_character_fade = true,
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
}

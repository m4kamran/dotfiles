return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      notifier = { enabled = false },
      words = { enabled = false },
      indent = { enabled = false },
      animate = { enabled = false },
      scroll = { enabled = false },
      dashboard = {
        preset = {
          header = [[
            _   .-')              .-. .-')   
            ( '.( OO )_            \  ( OO )  
            ,--.   ,--.)   .---.  ,--. ,--.  
            |   `.'   |   / .  |  |  .'   /  
            |         |  / /|  |  |      /,  
            |  |'.'|  | / / |  |_ |     ' _) 
            |  |   |  |/  '-'    ||  .   \   
            |  |   |  |`----|  |-'|  |\   \  
            `--'   `--'     `--'  `--' '--'  
          ]],
        },
      },
      lazygit = {
        config = {
          os = {
            editPreset = "nvim-remote",
            --    this does not work, i dunno why
            edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
          },
        },
      },
    },
  },
}

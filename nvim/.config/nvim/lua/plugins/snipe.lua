return {
  {
    "leath-dub/snipe.nvim",
    branch = "snipe2",
    keys = {
      {
        "<CR>",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    opts = {
      ui = {},
    },
  },
}

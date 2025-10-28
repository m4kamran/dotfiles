return {
  "tlj/api-browser.nvim",
  enabled = false,
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("api-browser").setup()
  end,
  keys = {
    { "<leader>Ra", "<cmd>ApiBrowser open<cr>", desc = "Select an API." },
    { "<leader>Rd", "<cmd>ApiBrowser select_local_server<cr>", desc = "Select environment." },
    { "<leader>Rx", "<cmd>ApiBrowser select_remote_server<cr>", desc = "Select remote environment." },
    { "<leader>Re", "<cmd>ApiBrowser endpoints<cr>", desc = "Open list of endpoints for current API." },
    { "<leader>Rr", "<cmd>ApiBrowser recents<cr>", desc = "Open list of recently opened API endpoints." },
    {
      "<leader>Rg",
      "<cmd>ApiBrowser endpoints_with_param<cr>",
      desc = "Open API endpoints valid for replacement text on cursor.",
    },
  },
}

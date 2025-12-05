return {
  {
    "kelvinauta/focushere.nvim",
    enabled = false,
    config = function()
      require("focushere").setup()
      vim.keymap.set("v", "zf", ":FocusHere<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "zf", ":FocusClear<CR>", { noremap = true, silent = true })
    end,
  },
}

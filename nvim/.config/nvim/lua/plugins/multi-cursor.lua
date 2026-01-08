return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    { "<up>", mode = { "n", "x" }, desc = "Add cursor above" },
    { "<down>", mode = { "n", "x" }, desc = "Add cursor below" },
    { "<leader><up>", mode = { "n", "x" }, desc = "Skip cursor above" },
    { "<leader><down>", mode = { "n", "x" }, desc = "Skip cursor below" },
    { "<C-n>", mode = { "n", "x" }, desc = "Match add cursor prev" },
    -- { "<C-q>", mode = { "n", "x" }, desc = "Match skip cursor prev" },
    { "<C-N>", mode = { "n", "x" }, desc = "Match add cursor next" },
    -- { "<C-Q>", mode = { "n", "x" }, desc = "Match skip cursor next" },
    { "<C-a>", mode = { "n", "x" }, desc = "Match all add cursors" },
  },
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    local set = vim.keymap.set

    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)
    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end)
    set({ "n", "x" }, "<leader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "x" }, "<leader><down>", function()
      mc.lineSkipCursor(1)
    end)

    set({ "n", "x" }, "<C-n>", function()
      mc.matchAddCursor(-1)
    end)
    set({ "n", "x" }, "<C-q>", function()
      mc.matchSkipCursor(-1)
    end)
    set({ "n", "x" }, "<C-N>", function()
      mc.matchAddCursor(1)
    end)
    set({ "n", "x" }, "<C-Q>", function()
      mc.matchSkipCursor(1)
    end)

    set({ "n", "x" }, "<C-a>", mc.matchAllAddCursors)

    mc.addKeymapLayer(function(layerSet)
      layerSet({ "n", "x" }, "<left>", mc.nextCursor)
      layerSet({ "n", "x" }, "<right>", mc.prevCursor)

      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}

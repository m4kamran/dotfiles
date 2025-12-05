return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
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

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, "<C-n>", function()
      mc.matchAddCursor(1)
    end)
    set({ "n", "x" }, "<C-q>", function()
      mc.matchSkipCursor(1)
    end)
    set({ "n", "x" }, "<C-N>", function()
      mc.matchAddCursor(-1)
    end)
    set({ "n", "x" }, "<C-Q>", function()
      mc.matchSkipCursor(-1)
    end)

    -- Add all matches in the document
    set({ "n", "x" }, "<C-a>", mc.matchAllAddCursors)

    -- You can also add cursors with any motion you prefer:
    -- set("n", "<right>", function()
    --     mc.addCursor("w")
    -- end)
    -- set("n", "<leader><right>", function()
    -- log
    --     mc.skipCursor("w")
    -- end)

    -- Rotate the main cursor.
    set({ "n", "x" }, "<left>", mc.nextCursor)
    set({ "n", "x" }, "<right>", mc.prevCursor)

    -- Delete the main cursor.
    set({ "n", "x" }, "<C-x>", mc.clearCursors)
  end,
}

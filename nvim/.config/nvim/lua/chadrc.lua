-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "jellybeans",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.term = {
  float = {
    relative = "editor",
    row = 0.2,
    col = 0.15,
    width = 0.7,
    height = 0.6,
    border = "single",
  },

}

M.ui = {
  statusline = {
    -- Separator style and theme
    theme = "vscode", -- default, vscode, vscode_colored or minimal
    -- default, round, block, and arrow are supported only by the default statusline theme.
    -- the round and block separators are also supported by the minimal theme.
    separator_style = "arrow", -- default, round, block or arrow
  }
}

return M
-- material.nvim: Set the style using
-- darker, lighter, oceanic, palenight, deep ocean
-- vim.g.material_style = "darker"

require("rose-pine").setup({
	groups = {
		-- background = "#212121",
		background = "none",
		-- panel = "surface",
	},

	highlight_groups = {

		MatchParen = {
			fg = "love",
		},
		CursorLine = { bg = "#373535" },
	},
})

-- set colorscheme with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

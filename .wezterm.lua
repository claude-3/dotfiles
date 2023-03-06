local wezterm = require("wezterm")
return {
	color_scheme = "Afterglow",
	font_size = 20,
	-- window_decorations = "RESIZE",
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	-- use_fancy_tab_bar = false,
	-- tab_and_split_indices_are_zero_based = true,

	window_frame = {
		active_titlebar_bg = "#212121",
		border_left_width = "8px",
		border_left_color = "#212121",
	},
	-- window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	hyperlink_rules = {
		-- match the URL with a PORT
		-- such 'http://localhost:3000/index.html'
		{
			regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
			format = "$0",
		},
	},
}

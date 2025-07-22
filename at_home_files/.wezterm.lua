-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- The default fallback includes the popular Nerd Font Symbols font

-- window
config.window_frame = {
	font = wezterm.font_with_fallback({
		"Hack Nerd Font",
	}),
}
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 5

-- tab
config.enable_tab_bar = false

-- colors
config.color_scheme = "rose-pine-moon"

config.colors = {
	-- background = "#0D0D0D",
	background = "#1C0800",
}

-- fonts
-- config.font = wezterm.font_with_fallback({
-- 	"Hack Nerd Font",
-- })
config.font_size = 15

-- and finally, return the configuration to wezterm
return config

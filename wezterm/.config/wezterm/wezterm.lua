local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Moon"
config.font_size = 11
config.font_shaper = "Harfbuzz"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}
config.window_decorations = "RESIZE"
config.keys = {
	{ key = "v", mods = "CTRL", action = act({ PasteFrom = "Clipboard" }) },
}

return config

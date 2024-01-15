local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12
config.font_shaper = "Harfbuzz"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.initial_rows = 48
config.initial_cols = 160

return config

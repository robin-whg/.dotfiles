local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.font = "JetBrainsMono Nerd Font"

config.font_size = 12
config.color_scheme = "Tokyo Night Moon"
config.hide_tab_bar_if_only_one_tab = true

return config

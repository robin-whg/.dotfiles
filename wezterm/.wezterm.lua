local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11
config.font_shaper = "Harfbuzz"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}
config.initial_rows = 48
config.initial_cols = 160

return config

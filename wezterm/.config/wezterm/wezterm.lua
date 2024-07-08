-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.default_domain = 'WSL:Ubuntu'

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 11
config.font_shaper = "Harfbuzz"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}
config.initial_rows = 48
config.initial_cols = 160

-- and finally, return the configuration to wezterm
return config


local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.native_macos_fullscreen_mode = true
config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 13
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

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config

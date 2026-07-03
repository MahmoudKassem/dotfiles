local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.bidi_enabled = true
config.bidi_direction = "AutoLeftToRight"
config.color_scheme = 'GruvboxDarkHard'
config.enable_tab_bar = false
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 13
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font("", { weight = "Regular" })
	}
}
config.window_background_opacity = 0.92
config.window_close_confirmation = "NeverPrompt"

return config

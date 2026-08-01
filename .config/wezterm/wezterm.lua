local wezterm = require("wezterm")
local config = wezterm.config_builder()
local current_scheme = wezterm.color.get_builtin_schemes()["GruvboxDarkHard"]

config.bidi_enabled = true
config.bold_brightens_ansi_colors = "No"
config.colors = {
  scrollbar_thumb = current_scheme.ansi[8]
}
config.color_scheme = "GruvboxDarkHard"
config.enable_tab_bar = false
config.enable_scroll_bar = true
config.font = wezterm.font_with_fallback {
  { family = "HackNerdFont Mono",
    weight = "Regular"
  },
  {
    family = "Kawkab Mono",
    weight = "Bold"
  }
}
config.font_size = 13.0
config.min_scroll_bar_height = "4cell"
config.window_background_opacity = 0.92
config.window_close_confirmation = "NeverPrompt"

return config

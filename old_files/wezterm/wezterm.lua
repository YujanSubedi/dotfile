local wezterm = require 'wezterm';

return {
  enable_wayland = false,

  -- color_scheme = "Darcula",
  color_scheme = "Modified_gnome",
  font = wezterm.font { family="JetBrainsMono NF", weight="Bold" },
  font_rules = {
    { italic = true, font = wezterm.font { family="JetBrainsMono NF", weight="DemiBold", italic=true}, },
  },
  font_size = 13,

  max_fps = 120,
  enable_tab_bar = false,
  window_decorations = "NONE",
  window_background_opacity = 0.85,
  window_padding = { left = 7, right = 7, top = 7, bottom = 5, },
  window_close_confirmation = 'NeverPrompt',
  adjust_window_size_when_changing_font_size = true,

  scrollback_lines = 5000,
  enable_scroll_bar = false,
  check_for_updates = false,

  disable_default_key_bindings = true,
  keys = {
    { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom "Clipboard", },
    { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo "Clipboard", },
    { key = '`', mods = 'ALT', action = wezterm.action.SpawnWindow },
  },
}


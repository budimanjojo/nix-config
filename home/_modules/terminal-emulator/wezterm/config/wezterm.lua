local wezterm = require 'wezterm'
local act = wezterm.action

-- Start window maximized
wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return {
  -- Fonts
  font = wezterm.font("UbuntuMono Nerd Font"),
  font_size = 12.0,

  -- Appearance
  color_scheme = "Catppuccin Mocha",
  window_decorations = "RESIZE",
  enable_tab_bar = false,
  enable_scroll_bar = false,
  warn_about_missing_glyphs = false,
  window_close_confirmation = "NeverPrompt",

  -- Window layout
  window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0.5cell",
    bottom = "0.5cell",
  },

  -- Keyboard shortcuts
  disable_default_key_bindings = true,
  keys = {
    { key = "C",         mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
    { key = "V",         mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
    { key = "+",         mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
    { key = "_",         mods = "CTRL|SHIFT", action = act.DecreaseFontSize },
    { key = "Backspace", mods = "CTRL|SHIFT", action = act.ResetFontSize },
  },
}

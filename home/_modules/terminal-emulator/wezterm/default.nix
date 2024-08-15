{ config, lib, ... }:
let
  cfg = config.myHome.terminal-emulator.wezterm;
in
{
  options.myHome.terminal-emulator.wezterm = {
    enable = lib.mkEnableOption "WezTerm";
  };

  config = lib.mkIf (cfg.enable) {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local act = wezterm.action

        return {
          -- Fonts
          font = wezterm.font("UbuntuMono Nerd Font"),
          font_size = 12.0,

          -- Appearance
          enable_tab_bar = false,
          enable_scroll_bar = false,
          warn_about_missing_glyphs = false,

          -- Window layout
          window_padding = {
            left = "1cell",
            right = "1cell",
            top = "1cell",
            bottom = "0.5cell",
          },
          window_close_confirmation = "NeverPrompt",

          -- Color scheme
          color_scheme = "tokyonight_night",

          -- Keyboard shortcuts
          disable_default_key_bindings = true,
          keys = {
            { key = "X", mods = "CTRL|SHIFT", action = "ActivateCopyMode" },
            { key = "C", mods = "CTRL|SHIFT", action = act.CopyTo("ClipboardAndPrimarySelection") },
            { key = "V", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
            { key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
            { key = "_", mods = "CTRL|SHIFT", action = "DecreaseFontSize" },
            { key = "Backspace", mods = "CTRL|SHIFT", action = "ResetFontSize" },
            { key = "F5", action = "ReloadConfiguration" },
          },
        }
      '';
    };
  };
}

{ config, lib, ... }:
let
  cfg = config.myHome.windowmanager.add-on.theme.tokyonight;
  # Tokyonight Night color scheme
  color = {
    bg = "#1a1b26";
    bg_dark = "#16161e";
    bg_highlight = "#292e42";
    blue = "#7aa2f7";
    blue0 = "#3d59a1";
    blue1 = "#2ac3de";
    blue2 = "#0db9d7";
    blue5 = "#89ddff";
    blue6 = "#b4f9f8";
    blue7 = "#394b70";
    comment = "#565f89";
    cyan = "#7dcfff";
    dark3 = "#545c7e";
    dark5 = "#737aa2";
    fg = "#c0caf5";
    fg_dark = "#a9b1d6";
    fg_gutter = "#3b4261";
    green = "#9ece6a";
    green1 = "#73daca";
    green2 = "#41a6b5";
    magenta = "#bb9af7";
    magenta2 = "#ff007c";
    orange = "#ff9e64";
    purple = "#9d7cd8";
    red = "#f7768e";
    red1 = "#db4b4b";
    teal = "#1abc9c";
    terminal_black = "#414868";
    yellow = "#e0af68";
  };
in
{
  options.myHome.windowmanager.add-on.theme.tokyonight = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Enable Tokyonight Night theme for window manager.

        Only works in i3 and Sway window manager.
      '';
    };
  };

  config = lib.mkIf (cfg.enable) {
    wayland.windowManager.sway.config.colors = {
      focused = {
        border = color.bg;
        background = color.bg;
        text = color.red;
        indicator = color.blue;
        childBorder = color.fg_dark;
      };
      unfocused = {
        border = color.bg;
        background = color.bg;
        text = color.fg_dark;
        indicator = color.blue;
        childBorder = color.fg_dark;
      };
      focusedInactive = {
        border = color.bg;
        background = color.bg;
        text = color.fg_dark;
        indicator = color.blue;
        childBorder = color.fg_dark;
      };
      urgent = {
        border = color.red;
        background = color.red;
        text = color.fg_dark;
        indicator = color.blue;
        childBorder = color.fg_dark;
      };
    };
    xsession.windowManager.i3.config = {
      colors = {
        focused = {
          border = color.bg;
          background = color.bg;
          text = color.red;
          indicator = color.fg_dark;
          childBorder = color.bg;
        };
        unfocused = {
          border = color.bg;
          background = color.bg;
          text = color.fg_dark;
          indicator = color.fg_dark;
          childBorder = color.bg;
        };
        focusedInactive = {
          border = color.bg;
          background = color.bg;
          text = color.fg_dark;
          indicator = color.fg_dark;
          childBorder = color.bg;
        };
        urgent = {
          border = color.red;
          background = color.red;
          text = color.fg;
          indicator = color.fg_dark;
          childBorder = color.bg;
        };
      };
      # TODO: use polibar instead
      bars = [
        {
          trayOutput = (builtins.head (builtins.filter (m: m.primary) config.myHardware.monitors)).name;
          statusCommand = "py3status";
          fonts = {
            names = [ "UbuntuMono Nerd Font" ];
            size = 12.0;
          };
          position = "top";
          colors = {
            background = color.bg;
            separator = color.fg;
            activeWorkspace = {
              border = color.bg;
              background = color.bg;
              text = color.red;
            };
            focusedWorkspace = {
              border = color.bg;
              background = color.bg;
              text = color.red;
            };
            inactiveWorkspace = {
              border = color.bg;
              background = color.bg;
              text = color.fg;
            };
            urgentWorkspace = {
              border = color.red;
              background = color.red;
              text = color.fg;
            };
          };
        }
      ];
    };
  };
}

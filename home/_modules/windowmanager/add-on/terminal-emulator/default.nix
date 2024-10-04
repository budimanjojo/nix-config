{ config, lib, ... }:
let
  cfg = config.myHome.windowmanager.add-on.terminal-emulator;
  super = "Mod4";
  inherit (lib)
    mkOption
    types
    mkIf
    mkMerge
    ;
  mkDefaultTerminal = term: {
    myHome.terminal-emulator.${term}.enable = true;
    wayland.windowManager = {
      hyprland.settings.bind = [ "SUPER, t, exec, ${term}" ];
      sway.config.keybindings."${super}+t" = "exec --no-startup-id ${term}";
    };
    xsession.windowManager.i3.config.keybindings."${super}+t" = "exec --no-startup-id ${term}";
  };
in
{
  options.myHome.windowmanager.add-on.terminal-emulator = {
    default = mkOption {
      type = types.nullOr (
        types.enum [
          "alacritty"
          "contour"
          "kitty"
          "wezterm"
        ]
      );
      default = null;
    };
  };

  config = mkIf (cfg.default != null) (mkMerge [
    (mkIf (cfg.default == "alacritty") (mkDefaultTerminal "alacritty"))
    (mkIf (cfg.default == "contour") (mkDefaultTerminal "contour"))
    (mkIf (cfg.default == "kitty") (mkDefaultTerminal "kitty"))
    (mkIf (cfg.default == "wezterm") (mkDefaultTerminal "wezterm"))
  ]);
}

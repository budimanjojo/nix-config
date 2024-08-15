{
  config,
  lib,
  pkgs,
  options,
  ...
}:
let
  inherit (lib)
    getExe
    mkOption
    types
    mkPackageOption
    mkIf
    ;

  cfg = config.myHome.browser.firefox;
  rofiExe = getExe config.programs.rofi.package;
  firefoxExe = getExe config.programs.firefox.package;

  # need a wrapper to replace Firefox profile manager
  # https://github.com/nix-community/home-manager/issues/3117
  rofiWrapper = pkgs.writeShellScriptBin "rofi-firefox-wrapper" ''
    cfgFile=$HOME/.mozilla/firefox/profiles.ini

    if test -f "$cfgFile"; then
      i=0
      profiles=$(grep 'Name' "$cfgFile" | sed 's/Name=//g')

      while read -r; do
        i=$((i+1))
      done < <(echo "$profiles")

      if [ $i -gt 1 ]; then
        options=$(echo "$profiles" | sed ':a; N; $!ba; s/\n/\\n/g')
        chosen=$(echo -e "$options" | ${rofiExe} -dmenu -P "Select Firefox Profile")
        if [ "$chosen" != "" ]; then
          ${firefoxExe} -P "$chosen"
        fi
      else
        ${firefoxExe}
      fi
    else
      ${firefoxExe}
    fi
  '';
in
{
  options.myHome.browser.firefox = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enable Firefox Web Browser.
        This module include a wrapper that will open up `rofi` profile selector when you have more than one profile or open Firefox normally otherwise.

        The wrapper can be accessed by pressing `Super+W` on the keyboard in i3, Hyprland, and Sway window manager.
      '';
    };
    package = mkPackageOption pkgs "firefox" { };
    profiles = mkOption {
      type = options.programs.firefox.profiles.type;
      default = {
        "" = {
          id = 0;
          name = "${config.myHome.username}";
          isDefault = true;
        };
      };
    };
  };

  config = mkIf (cfg.enable) {
    programs.firefox = {
      enable = true;
      package = cfg.package;
      profiles = cfg.profiles;
    };

    wayland.windowManager = {
      hyprland.settings.bind = [ "SUPER, w, exec, ${getExe rofiWrapper}" ];
      sway.config.keybindings."Mod4+w" = "exec --no-startup-id ${getExe rofiWrapper}";
    };

    xsession.windowManager.i3.config.keybindings."Mod4+w" = "exec --no-startup-id ${getExe rofiWrapper}";
  };
}

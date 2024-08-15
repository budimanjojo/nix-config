{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.myHome.windowmanager.add-on.screenshotter;
  wl-full-screenshot = pkgs.writeShellScriptBin "wl-full-screenshot" ''
    IMG=~/Desktop/$(date +%Y%m%d_%Hh%mm%Ss).png
    ${pkgs.grim}/bin/grim $IMG \
      && ${pkgs.wl-clipboard}/bin/wl-copy < "$IMG" \
      && ${pkgs.pipewire}/bin/pw-cat -p ${./camera-shutter.oga} \
      && ${pkgs.libnotify}/bin/notify-send "Screenshot copied to clipboard and saved in your Desktop folder"
  '';

  wl-region-screenshot = pkgs.writeShellScriptBin "wl-region-screenshot" ''
    IMG=~/Desktop/$(date +%Y%m%d_%Hh%mm%Ss).png
    ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$IMG" \
      && ${pkgs.wl-clipboard}/bin/wl-copy < "$IMG" \
      && ${pkgs.pipewire}/bin/pw-cat -p ${./camera-shutter.oga} \
      && ${pkgs.libnotify}/bin/notify-send "Screenshot copied to clipboard and saved in your Desktop folder"
  '';

  x-full-screenshot = pkgs.writeShellScriptBin "x-full-screenshot" ''
    IMG=~/Desktop/$(date +%Y%m%d_%Hh%mm%Ss).png
    ${pkgs.scrot}/bin/scrot -e '${pkgs.xclip}/bin/xclip -sel clipboard -t image/png -i $f' -F "$IMG" \
      && ${pkgs.pipewire}/bin/pw-cat -p ${./camera-shutter.oga} \
      && ${pkgs.libnotify}/bin/notify-send "Screenshot copied to clipboard and saved in your Desktop folder"
  '';

  x-region-screenshot = pkgs.writeShellScriptBin "x-region-screenshot" ''
    IMG=~/Desktop/$(date +%Y%m%d_%Hh%mm%Ss).png
    ${pkgs.scrot}/bin/scrot -s -e '${pkgs.xclip}/bin/xclip -sel clipboard -t image/png -i $f' -F "$IMG" \
      && ${pkgs.pipewire}/bin/pw-cat -p ${./camera-shutter.oga} \
      && ${pkgs.libnotify}/bin/notify-send "Screenshot copied to clipboard and saved in your Desktop folder"
  '';

  modeName = "Screenshot: (Enter) Full screenshot, (s) Select region";
in
{
  options.myHome.windowmanager.add-on.screenshotter = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Enable screenshotter.
        This module will let you go to `screenshot mode` on `Printscreen` keypress in.
        Once in the mode, you can press `Enter` to take full screenshot or `r` to take region screenshot with mouse selection.
        The screenshot will be saved in `~/Desktop` directory and in your clipboard so you can paste the picture in applications.

        Only works in i3, Hyprland, and Sway window manager.
      '';
    };
  };

  config = lib.mkIf (cfg.enable) {
    wayland.windowManager = {
      hyprland = {
        extraConfig = ''
          submap = ${modeName}
          bind = , return, execr, ${lib.getExe wl-full-screenshot}
          bind = , return, submap, reset
          bind = , s, exec, ${lib.getExe wl-region-screenshot}
          bind = , s, submap, reset
          # return to normal mode
          bind = , escape, submap, reset
          submap = reset
        '';
        settings.bind = [ ", print, submap, ${modeName}" ];
      };
      sway.config = {
        modes.${modeName} = {
          Return = "exec ${lib.getExe wl-full-screenshot}, mode default";
          "--release s" = "exec ${lib.getExe wl-region-screenshot}, mode default";
          Escape = "mode default";
        };
        keybindings = {
          Print = "mode \"${modeName}\"";
        };
      };
    };

    xsession.windowManager.i3.config = {
      modes.${modeName} = {
        Return = "exec ${lib.getExe x-full-screenshot}, mode default";
        "--release s" = "exec ${lib.getExe x-region-screenshot}, mode default";
        Escape = "mode default";
      };
      keybindings = {
        Print = "mode \"${modeName}\"";
      };
    };
  };
}

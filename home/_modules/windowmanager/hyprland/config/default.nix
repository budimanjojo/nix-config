{
  config,
  pkgs,
  lib,
  ...
}:
let
  myHardware = config.myHardware;
  resizeMode = "Resize: (h/Left) width- (j/Down) height-, (k/Up) height+, (l/Right) width+";
in
{
  # Submaps are impossible to be defined in settings
  extraConfig = ''
    # Resize window
    submap = ${resizeMode}
    binde = , h, resizeactive, -10 0
    binde = , j, resizeactive, 0 10
    binde = , k, resizeactive, 0 -10
    binde = , l, resizeactive, 10 0
    # Or use arrow keys
    binde = , left, resizeactive, -10 0
    binde = , down, resizeactive, 0 10
    binde = , up, resizeactive, 0 -10
    binde = , right, resizeactive, 10 0
    # Return to normal mode
    bind = , escape, submap, reset
    submap = reset
  '';

  settings =
    {
      # Monitor placement
      # [ "<name>,<width>x<height>,<x>x<y>,1" ... ]
      monitor = builtins.map (
        m: "${m.name},${toString m.width}x${toString m.height},${toString m.x}x${toString m.y},1"
      ) myHardware.monitors;

      # Wallpaper
      # [ "swaybg -o <name> -i <path>" ... ]
      exec-once = builtins.map (m: "${pkgs.swaybg}/bin/swaybg -o ${m.name} -i ${m.wallpaper}") (
        builtins.filter (m: m.wallpaper != null) myHardware.monitors
      );

      # General settings
      general = {
        resize_on_border = true;
      };
      input = {
        numlock_by_default = true;
        follow_mouse = 1;
      };
      misc = {
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
      env = lib.mkIf (myHardware.gpuDriver == "nvidia") [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
    }
    // (import ./keybindings.nix { inherit config resizeMode pkgs; })
    // (import ./ws-outputs.nix { inherit config; })
    // (import ./window-rules.nix)
    // (import ./appearances.nix);
}

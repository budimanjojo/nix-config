{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.picom;
in {
  options.hm-modules.windowmanager.add-on.picom = { enable = mkEnableOption "picom"; };

  config = mkIf cfg.enable {
    services.picom = {
      enable = true;
      settings = {
        # Shadows
        shadow = true;
        shadow-radius = 7;
        shadow-opacity = .7;
        shadow-offset-x = -7;
        shadow-offset-y = -7;
        shadow-red = 0.8;
        shadow-green = 0;
        shadow-blue = 0;
        shadow-exclude = [
          "name = 'Notification'"
          "class_g = 'Conky'"
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
          "_GTK_FRAME_EXTENTS@:c"
          #"_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'",
          "class_g ?= 'i3-frame'"
          "class_g ?= 'Dunst'"
        ];
        # shadow-exclude-reg = ""
        # xinerama-shadow-crop = false
        # xinerama-shadow-crop = true;

        # Fading
        fading = true;
        fade-in-step = 0.03;
        fade-out-step = 0.03;
        # fade-delta = 10
        fade-exclude = [
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
        ];
        # no-fading-openclose = false
        # no-fading-destroyed-argb = false

        # Transparency / Opacity
        inactive-opacity = 0.98;
        frame-opacity = 1.0;
        inactive-opacity-override = false;
        active-opacity = 1.0;
        inactive-dim = 0.3;
        focus-exclude = [
          "class_g = 'Cairo-clock'"
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
        ];
        inactive-dim-fixed = 1.0;
        opacity-rule = [
          "50:class_g = 'Dmenu'"
          "93:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
          "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
          "93:class_g = 'Gnome-terminal'"
          "93:class_g = 'Thunar'"
        ];

        # Corners
        corner-radius = 0;
        rounded-corners-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
        ];

        # Background-Blurring
        # blur-method =
        # blur-size = 12
        # blur-deviation = false
        # blur-strength = 5
        # blur-background = false
        # blur-background-frame = false
        # blur-background-fixed = false
        blur-kern = "3x3box";
        blur-background-exclude = [
          "window_type = 'dock'"
          "window_type = 'desktop'"
          "_GTK_FRAME_EXTENTS@:c"
        ];

        # General Settings
        # daemon = false
        backend = "xrender";
        # vsync = true;
        # dbus = false
        mark-wmwin-focused = true;
        mark-ovredir-focused = true;
        detect-rounded-corners = true;
        detect-client-opacity = true;
        use-ewmh-active-win = true;
        unredir-if-possible = false;
        unredir-if-possible-delay = 5000; # miliseconds
        unredir-if-possible-exclude = [];
        detect-transient = true;
        detect-client-leader = true;
        # resize-damage = 1
        invert-color-include = [];
        glx-no-stencil = true;
        glx-no-rebind-pixmap = true;
        use-damage = true;
        # xrender-sync-fence = false
        # glx-fshader-win = ""
        # force-win-blend = false
        # no-ewmh-fullscreen = false
        # max-brightness = 1.0
        # transparent-clipping = false
        log-level = "info";
        # log-file = "/path/to/your/log/file"
        # show-all-xerrors = false
        # write-pid-path = "/path/to/your/log/file"
        wintypes =
        {
          tooltip = {
            fade = true;
            shadow = false;
            opacity = 0.85;
            focus = true;
          };
          dock = {
            shadow = false;
          };
          dnd = {
            shadow = false;
          };
          popup_menu = {
            opacity = 0.8;
          };
          dropdown_menu = {
            opacity = 0.9;
            shadow = false;
          };
        };
      };
    };
  };
}

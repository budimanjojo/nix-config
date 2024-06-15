{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.dunst;
in
{
  options.hm-modules.windowmanager.add-on.dunst = {
    enable = mkEnableOption "dunst";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.libnotify ];
    services.dunst = {
      enable = true;
      settings = {
        global = {
          follow = "mouse";
          width = 300;
          height = 300;
          origin = "top-right";
          offset = "10x10";
          scale = 0;
          notification_limit = 10;
          progress_bar = true;
          progress_bar_height = 10;
          progress_bar_frame_width = 1;
          progress_bar_min_width = 150;
          progress_bar_max_width = 300;
          indicate_hidden = "yes";
          transparency = 0;
          separator_height = 2;
          padding = 8;
          horizontal_padding = 8;
          text_icon_padding = 0;
          frame_width = 1;
          frame_color = "#C0CAF5";
          separator_color = "frame";
          sort = "yes";
          idle_threshold = 120;
          font = "UbuntuMono Nerd Font 12";
          line_height = 0;
          markup = "full";
          format = "<b>%s</b>\\n%b";
          alignment = "left";
          vertical_alignment = "center";
          show_age_threshold = 60;
          ellipsize = "middle";
          ignore_newline = "no";
          stack_duplicates = false;
          hide_duplicate_count = false;
          show_indicators = "yes";
          icon_position = "left";
          min_icon_size = 16;
          max_icon_size = 16;
          icon_path = "/usr/share/icons/Vimix-Doder-dark/16/actions/:/usr/share/icons/Vimix-Doder-dark/16/devices:/usr/share/icons/Vimix-Doder-dark/places/:/usr/share/icons/Vimix-Doder-dark/16/mimetypes/:/usr/share/icons/Vimix-Doder-dark/16/panel/:/usr/share/icons/Vimix-Doder-dark/16/status/";
          sticky_history = "yes";
          history_length = 20;
          dmenu = "/usr/bin/dmenu -p dunst:";
          browser = "$BROWSER";
          always_run_script = true;
          title = "Dunst";
          class = "Dunst";
          corner_radius = 5;
          ignore_dbusclose = false;
          layer = "top";
          force_xwayland = false;
          force_xinerama = false;
          mouse_left_click = "do_action";
          mouse_middle_click = "close_current";
          mouse_right_click = "close_current";
        };
        experimental = {
          per_monitor_dpi = false;
        };
        urgency_low = {
          background = "#1A1B26";
          foreground = "#7AA2F7";
          timeout = 10;
        };
        urgency_normal = {
          background = "#1A1B26";
          foreground = "#9ECE6A";
          timeout = 10;
        };
        urgency_critical = {
          background = "#1A1B26";
          foreground = "#F7768E";
          timeout = 0;
        };
      };
    };
  };
}

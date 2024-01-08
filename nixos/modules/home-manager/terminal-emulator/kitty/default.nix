{ lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.terminal-emulator.kitty;
in {
  options.hm-modules.terminal-emulator.kitty = { enable = mkEnableOption "kitty"; };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "UbuntuMono Nerd Font";
        size = 12;
      };
      settings = {
        # Cursor
        cursor = "#C0CAF5";
        cursor_text_color = "#202124";
        cursor_shape = "underline";
        cursor_blink_interval = "-1";

        # Scrollback
        scrollback_lines = 10000;

        # Mouse
        mouse_hide_wait = "-1";
        url_color = "#73DACA";
        url_style = "curly";

        #Terminal bell
        enable_audio_bell = "no";
        visual_bell_duration = 0;

        # Window layout
        window_padding_width = 4;
        confirm_os_window_close = 0;

        # Color scheme
        background = "#1A1B26";
        foreground = "#C0CAF5";
        color0 = "#15161E";
        color1 = "#F7768E";
        color2 = "#9ECE6A";
        color3 = "#E0AF68";
        color4 = "#7AA2F7";
        color5 = "#BB9AF7";
        color6 = "#7DCFFF";
        color7 = "#A9B1D6";
        color8 = "#414868";
        color9 = "#F7768E";
        color10 = "#9ECE6A";
        color11 = "#E0AF68";
        color12 = "#7AA2F7";
        color13 = "#BB9AF7";
        color14 = "#7DCFFF";
        color15 = "#C0CAF5";
        color16 = "#FF9E64";
        color17 = "#DB4B4B";

        # Advanced
        allow_remote_control = "no";
        shell_integration = "disabled";
        term = "xterm-256color";
      };
    };
  };
}

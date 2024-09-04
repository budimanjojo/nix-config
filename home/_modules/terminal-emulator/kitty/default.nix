{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.terminal-emulator.kitty;
in
{
  options.myHome.terminal-emulator.kitty = {
    enable = lib.mkEnableOption "kitty";
  };

  config = lib.mkIf (cfg.enable) {
    programs.kitty = {
      enable = true;
      package = (config.lib.nixGL.wrap pkgs.kitty);
      catppuccin.enable = true;
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

        # Advanced
        allow_remote_control = "no";
        shell_integration = "disabled";
        term = "xterm-256color";
      };
    };
  };
}

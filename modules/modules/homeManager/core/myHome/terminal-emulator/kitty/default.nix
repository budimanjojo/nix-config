{
  flake.modules.homeManager.core =
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
      options.myHome.terminal-emulator.kitty.enable = lib.mkEnableOption "kitty";

      config = lib.mkIf (cfg.enable) {
        catppuccin.kitty.enable = true;
        programs.kitty = {
          enable = true;
          package = (config.lib.nixGL.wrap pkgs.kitty);
          font = {
            name = "UbuntuMono Nerd Font";
            size = 12;
          };
          settings = {
            # cursor
            cursor = "#C0CAF5";
            cursor_text_color = "#202124";
            cursor_shape = "underline";
            cursor_blink_interval = "-1";

            # scrollback
            scrollback_lines = 10000;

            # mouse
            mouse_hide_wait = "-1";
            url_color = "#73DACA";
            url_style = "curly";

            # terminal bell
            enable_audio_bell = "no";
            visual_bell_duration = 0;

            # window layout
            window_padding_width = 4;
            confirm_os_window_close = 0;

            # advanced
            allow_remote_control = "no";
            shell_integration = "disabled";
            term = "xterm-256color";
          };
        };
      };
    };
}

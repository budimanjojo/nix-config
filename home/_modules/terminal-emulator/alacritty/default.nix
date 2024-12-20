{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.myHome.terminal-emulator.alacritty;
in
{
  options.myHome.terminal-emulator.alacritty = {
    enable = mkEnableOption "alacritty";
  };

  config = mkIf (cfg.enable) {
    catppuccin.alacritty.enable = true;

    programs.alacritty = {
      enable = true;
      package = (config.lib.nixGL.wrap pkgs.alacritty);
      settings = {
        general.live_config_reload = true;
        env.TERM = "xterm-256color";
        window = {
          padding = {
            x = 10;
            y = 10;
          };
          dynamic_padding = true;
          decorations = "none";
          startup_mode = "Maximized";
        };
        scrolling.history = 10000;
        font = {
          size = 12.0;
          normal = {
            family = "UbuntuMono Nerd Font";
            style = "Regular";
          };
        };
        colors = {
          draw_bold_text_with_bright_colors = false;
        };
        bell.duration = 0;
      };
    };
  };
}

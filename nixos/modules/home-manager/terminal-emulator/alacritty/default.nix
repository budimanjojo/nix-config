{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.terminal-emulator.alacritty;
in {
  options.hm-modules.terminal-emulator.alacritty = { enable = mkEnableOption "alacritty"; };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";
        window = {
          dimensions = {
            columns = 0;
            lines = 0;
          };
          padding = {
            x = 10;
            y = 10;
          };
        };
        scrolling.history = 10000;
        font.normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
          size = 13.0;
        };
        draw_bold_text_with_bright_colors = false;
        colors = {
          primary = {
            background = "#1A1B26";
            foreground = "#C0CAF5";
          };
          normal = {
            black = "#15161E";
            red = "#F7768E";
            green = "#9ECE6A";
            yellow = "#E0AF68";
            blue = "#7AA2F7";
            magenta = "#BB9AF7";
            cyan = "#7DCFFF";
            white = "#A9B1D6";
          };
          bright = {
            black = "#414868";
            red = "#F7768E";
            green = "#9ECE6A";
            yellow = "#E0AF68";
            blue = "#7AA2F7";
            magenta = "#BB9AF7";
            cyan = "#7DCFFF";
            white = "#C0CAF5";
          };
          indexed_colors = [
            { index = 16; color = "#FF9E64"; }
            { index = 17; color = "#DB4B4B"; }
          ];
        };
        bell.duration = 0;
        live_config_reload = true;
      };
    };
  };
}

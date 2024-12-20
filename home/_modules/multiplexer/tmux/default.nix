{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.multiplexer.tmux;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.myHome.multiplexer.tmux = {
    enable = mkEnableOption "tmux";
  };

  config = mkIf (cfg.enable) {
    catppuccin.tmux = {
      enable = true;
      extraConfig = ''
        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_current_number_color "#{@thm_green}"
        set -g @catppuccin_window_text ""
        set -g @catppuccin_window_number "#[bold]Tab ###I "
        set -g @catppuccin_window_current_text ""
        set -g @catppuccin_window_current_number "#[bold]Tab ###I "
        set -g @catppuccin_window_status_style "custom"
        set -g @catppuccin_window_right_separator "#[fg=#{@_ctp_status_bg},reverse]#[none]"

        set -g @catppuccin_window_left_separator "#[fg=#{@_ctp_status_bg}]#[none]"
        set -g @catppuccin_window_middle_separator "#[bg=#{@catppuccin_window_number_color},fg=#{@catppuccin_window_text_color}]"
        set -g @catppuccin_window_current_middle_separator "#[bg=#{@catppuccin_window_current_number_color},fg=#{@catppuccin_window_current_text_color}]"

        set -g window-status-separator ""
        set -g status-left-length 0
        set -g status-left "#[fg=#{@thm_fg} bold]TMUX (#S) "
        set -ga status-left "#{?client_prefix,#[fg=#{@thm_red} bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=#{@thm_yellow} bold]COPY ,#[fg=#{@thm_green} bold]NORMAL }}"
        set -g status-right ""
      '';
    };

    programs.tmux = {
      enable = true;
      package = pkgs.tmux;
      extraConfig = ''
        ${
          if config.myHome.isWayland then
            "set -g copy-command '${pkgs.wl-clipboard}/bin/wl-copy'"
          else
            "set -g copy-command '${pkgs.xsel}/bin/xsel -i -b'"
        }

        ${builtins.readFile ./config/tmux.conf}
      '';
    };
  };
}

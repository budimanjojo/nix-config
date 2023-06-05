{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.multiplexer.tmux;
in {
  options.modules.multiplexer.tmux = { enable = mkEnableOption "tmux"; };

  config = mkIf cfg.enable {
    home.manager = {
      # TODO: use tmux home-manager module when it matures
      home.packages = [ pkgs.tmux ];
      xdg.configFile."tmux/tmux.conf".source = ./config/tmux.conf;
    };
  };
}

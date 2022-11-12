{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.multiplexer.tmux;
in {
  options.modules.multiplexer.tmux = { enable = mkEnableOption "tmux"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.tmux = {
        enable = true;
      };
      home.file.".tmux.conf".source = ./.tmux.conf;
    };
  };
}

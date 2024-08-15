{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.multiplexer.tmux;
in
with lib;
{
  options.myHome.multiplexer.tmux = {
    enable = mkEnableOption "tmux";
  };

  config = mkIf (cfg.enable) {
    home.packages = [ pkgs.tmux ];
    # TODO: use tmux home-manager module when it matures
    xdg.configFile."tmux".source = ./config;
  };
}

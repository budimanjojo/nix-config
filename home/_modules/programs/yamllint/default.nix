{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.programs.yamllint;
in
{
  options.myHome.programs.yamllint = {
    enable = lib.mkEnableOption "YAMLlint";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [ pkgs.yamllint ];
    xdg.configFile."yamllint/config".source = ./config.yaml;
  };
}

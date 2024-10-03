{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.terminal-emulator.contour;
in
{
  options.myHome.terminal-emulator.contour = {
    enable = lib.mkEnableOption "Contour Terminal Emulator";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [ (config.lib.nixGL.wrap pkgs.contour) ];
    xdg.configFile."contour".source = ./config;
  };
}

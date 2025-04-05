{
  lib,
  config,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (lib) myLib mkEnableOption mkIf;
  cfg = config.myHome.programs.qmk;
  systemEnabled = myLib.systemEnabled "mySystem.programs.qmk.enable" osConfig;
  isNixos = myLib.isNixos osConfig;
in
{
  options.myHome.programs.qmk = {
    enable = mkEnableOption "QMK";
  };

  config = mkIf (cfg.enable) {
    warnings = mkIf (!systemEnabled && isNixos) [
      ''
        You have enabled QMK home-manager module but not the NixOS system module and you are using NixOS.
        Some things might not work properly.
      ''
    ];
    myHome.shell.git.enable = true;

    xdg.configFile."qmk/qmk.ini".source = ./qmk.ini;

    home.packages = with pkgs; [ qmk ];
  };
}

{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.hm-modules.homelab.diy-keyboard;
in {
  options.hm-modules.homelab.diy-keyboard = { enable = mkEnableOption "diy-keyboard"; };
  config = mkIf cfg.enable {
    hm-modules.shell.git.enable = true;

    xdg.configFile."qmk".source = ./qmk;

    home.packages = with pkgs; [
      via
      qmk
    ];
  };
}

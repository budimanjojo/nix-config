{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.modules.homelab.diy-keyboard;
in {
  options.modules.homelab.diy-keyboard = { enable = mkEnableOption "diy-keyboard"; };
  config = mkIf cfg.enable {
    hardware.keyboard.qmk.enable = true;
    services.udev.packages = with pkgs; [
      via
    ];
    modules.shell.git.enable = true;

    home.manager = {
      xdg.configFile."qmk".source = ./qmk;

      home.packages = with pkgs; [
        via
        qmk
      ];
    };
  };
}

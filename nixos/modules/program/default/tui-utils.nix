{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.program.tui-utils;
in {
  options.modules.program.tui-utils = { enable = mkEnableOption "default tui-utils"; };

  config = mkIf cfg.enable {
    nh.enable = true;
    home.manager.home.packages = with pkgs; [
      age
      dig
      htop
      hwatch
      lm_sensors
      nfs-utils
      pciutils
      rsync
      tree
      usbutils
      vim
    ];
  };
}

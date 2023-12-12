{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.program.tui-utils;
in {
  options.hm-modules.program.tui-utils = { enable = mkEnableOption "default tui-utils"; };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
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

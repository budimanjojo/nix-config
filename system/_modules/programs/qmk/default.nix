{ config, lib, ... }:
let
  mySystem = config.mySystem;
  cfg = mySystem.programs.qmk;
in
{
  options.mySystem.programs.qmk = {
    enable = lib.mkEnableOption "QMK";
  };

  config = lib.mkIf (cfg.enable) {
    # needed for qmk udev rule
    users = {
      groups.plugdev = { };
      users.${mySystem.adminUser}.extraGroups = [ "plugdev" ];
    };
    hardware.keyboard.qmk.enable = true;
  };
}

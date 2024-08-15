{ config, lib, ... }:
let
  cfg = config.mySystem.programs.adb;
  mySystem = config.mySystem;
in
{
  options.mySystem.programs.adb = {
    enable = lib.mkEnableOption "adb";
  };

  config = lib.mkIf (cfg.enable) {
    programs.adb.enable = true;
    users.users.${mySystem.adminUser}.extraGroups = [ "adbusers" ];
  };
}

{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.adb;
in {
  options.modules.program.adb = { enable = mkEnableOption "adb"; };

  config = mkIf cfg.enable {
    programs.adb.enable = true;
    users.users.${config.deviceCfg.username}.extraGroups = [ "adbusers" ];
  };
}

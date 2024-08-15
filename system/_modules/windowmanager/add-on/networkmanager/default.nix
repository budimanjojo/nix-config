{ config, lib, ... }:
let
  cfg = config.mySystem.windowmanager.add-on.networkmanager;
  mySystem = config.mySystem;
in
{
  options.mySystem.windowmanager.add-on.networkmanager = {
    enable = lib.mkEnableOption "Network Manager";
  };

  config = lib.mkIf (cfg.enable) {
    networking.networkmanager.enable = true;
    users.users.${mySystem.adminUser}.extraGroups = [ "networkmanager" ];
  };
}

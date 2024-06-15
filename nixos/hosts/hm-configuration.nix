{ config, ... }:
let
  deviceCfg = config.deviceCfg;
in
{
  home = {
    username = deviceCfg.username;
    homeDirectory = "/home/" + deviceCfg.username;

    stateVersion = "23.11";
  };

  programs = {
    home-manager.enable = true;
  };
}

{ lib, config, ... }:

with lib;
let
  cfg = config.modules.homelab.docker;
in
{
  options.modules.homelab.docker = {
    enable = mkEnableOption "docker";
  };
  config = mkIf cfg.enable {
    virtualisation.docker.enable = true;
    users.users.${config.deviceCfg.username}.extraGroups = [ "docker" ];
  };
}

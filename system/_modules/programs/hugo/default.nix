{ config, lib, ... }:
let
  cfg = config.mySystem.programs.hugo;
in
{
  options.mySystem.programs.hugo = {
    enable = lib.mkEnableOption "Hugo";
  };

  config = lib.mkIf cfg.enable { networking.firewall.allowedTCPPorts = [ 1313 ]; };
}

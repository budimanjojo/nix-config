{ lib, config, ... }:
with lib;
let
  cfg = config.modules.program.hugo;
in
{
  options.modules.program.hugo = {
    enable = mkEnableOption "hugo";
  };

  config = mkIf cfg.enable { networking.firewall.allowedTCPPorts = [ 1313 ]; };
}

{ config, lib, ... }:
let
  cfg = config.myHome.services.nextcloud-client;
in
{
  options.myHome.services.nextcloud-client = {
    enable = lib.mkEnableOption "Nextcloud client";
  };

  config = lib.mkIf cfg.enable {
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}

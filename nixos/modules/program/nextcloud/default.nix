{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.nextcloud;
in {
  options.modules.program.nextcloud = { enable = mkEnableOption "nextcloud"; };

  config = mkIf cfg.enable {
    home.manager.services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}

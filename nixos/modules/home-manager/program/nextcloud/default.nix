{ lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.nextcloud;
in {
  options.hm-modules.program.nextcloud = { enable = mkEnableOption "nextcloud"; };

  config = mkIf cfg.enable {
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}

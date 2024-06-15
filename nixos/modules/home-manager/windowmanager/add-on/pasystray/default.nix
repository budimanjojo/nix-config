{ lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.pasystray;
in
{
  options.hm-modules.windowmanager.add-on.pasystray = {
    enable = mkEnableOption "pasystray";
  };

  config = mkIf cfg.enable { services.pasystray.enable = true; };
}

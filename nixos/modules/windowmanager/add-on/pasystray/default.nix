{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.pasystray;
in {
  options.modules.windowmanager.add-on.pasystray = { enable = mkEnableOption "pasystray"; };

  config = mkIf cfg.enable {
    home.manager.services.pasystray.enable = true;
  };
}

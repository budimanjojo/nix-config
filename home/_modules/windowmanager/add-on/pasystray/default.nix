{ config, lib, ... }:
let
  cfg = config.myHome.windowmanager.add-on.pasystray;
in
{
  options.myHome.windowmanager.add-on.pasystray = {
    enable = lib.mkEnableOption "pasystray";
  };

  config = lib.mkIf (cfg.enable) { services.pasystray.enable = true; };
}

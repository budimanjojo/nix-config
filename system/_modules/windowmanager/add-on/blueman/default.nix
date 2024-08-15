{ lib, config, ... }:
let
  mySystem = config.mySystem;
  cfg = mySystem.windowmanager.add-on.blueman;
in
{
  options.mySystem.windowmanager.add-on.blueman = {
    enable = lib.mkEnableOption "Blueman";
  };

  config = lib.mkIf (cfg.enable) { services.blueman.enable = true; };
}

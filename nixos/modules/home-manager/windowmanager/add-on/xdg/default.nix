{ lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.xdg;
in
{
  options.hm-modules.windowmanager.add-on.xdg = {
    enable = mkEnableOption "xdg";
  };

  config = mkIf cfg.enable {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}

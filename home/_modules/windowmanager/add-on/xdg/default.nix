{ config, lib, ... }:
let
  cfg = config.myHome.windowmanager.add-on.xdg;
in
{
  options.myHome.windowmanager.add-on.xdg = {
    enable = lib.mkEnableOption "xdg";
  };

  config = lib.mkIf (cfg.enable) {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}

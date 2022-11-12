{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.xdg;
in {
  options.modules.windowmanager.add-on.xdg = { enable = mkEnableOption "xdg"; };

  config = mkIf cfg.enable {
    home.manager.xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}

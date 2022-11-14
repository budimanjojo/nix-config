{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.syncthing;
in {
  options.modules.program.syncthing = { enable = mkEnableOption "syncthing"; };

  config = mkIf cfg.enable {
    home.manager = {
      services.syncthing = {
        enable = true;
        tray.enable = true;
      };
      xdg.configFile."syncthingtray.ini".source = ./syncthingtray.ini;
    };
  };
}

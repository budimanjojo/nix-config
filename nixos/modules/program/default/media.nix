{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.media;
in {
  options.modules.program.media = { enable = mkEnableOption "default media"; };

  config = mkIf cfg.enable {
    home.manager.home.packages = with pkgs; [
      gnome.eog
      gnome.totem
      rhythmbox
    ];
  };
}

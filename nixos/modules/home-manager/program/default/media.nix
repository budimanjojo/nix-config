{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.hm-modules.program.media;
in
{
  options.hm-modules.program.media = {
    enable = mkEnableOption "default media";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnome.eog
      gnome.totem
      rhythmbox
    ];
  };
}

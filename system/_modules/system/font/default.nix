{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mySystem.system.font;
in
{
  options.mySystem.system.font = {
    enable = lib.mkEnableOption "font";
  };

  config = lib.mkIf (cfg.enable) {
    fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "UbuntuMono" ]; })
      unifont
    ];
  };
}

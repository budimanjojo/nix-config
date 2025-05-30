{
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  config = lib.mkIf (!lib.myLib.isNixos osConfig) {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      nerd-fonts.ubuntu-mono
      unifont
    ];
  };
}

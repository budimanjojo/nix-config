{ myLib, ... }:
{
  flake.modules.homeManager.core =
    {
      lib,
      osConfig ? { },
      pkgs,
      ...
    }:
    {
      config = lib.mkIf (!myLib.isNixos osConfig) {
        fonts.fontconfig.enable = true;
        home.packages = with pkgs; [
          nerd-fonts.ubuntu-mono
          unifont
        ];
      };
    };
}

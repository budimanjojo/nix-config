{
  lib,
  osConfig,
  pkgs,
  config,
  ...
}:
let
  isNixos = lib.myLib.isNixos osConfig;
in
{
  config = {
    home.packages = lib.mkIf (!isNixos) [
      pkgs.sops
      pkgs.age
    ];
    sops.age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
      generateKey = true; # generate the key if it doesn't exist
    };
  };
}

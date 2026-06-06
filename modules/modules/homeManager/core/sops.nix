{ myLib, ... }:
{
  flake.modules.homeManager.core =
    {
      osConfig ? { },
      lib,
      pkgs,
      config,
      ...
    }:
    let
      isNixos = myLib.isNixos osConfig;
    in
    {
      # only enable when we are not on NixOS
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

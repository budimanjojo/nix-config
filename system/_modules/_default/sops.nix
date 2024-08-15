{ config, pkgs, ... }:
let
  mySystem = config.mySystem;
in
{
  config = {
    environment.systemPackages = [
      pkgs.sops
      pkgs.age
    ];
    sops.age = {
      keyFile = "${config.users.users.${mySystem.adminUser}.home}/.config/sops/age/keys.txt";
      generateKey = true; # generate the key if it doesn't exist
    };
  };
}

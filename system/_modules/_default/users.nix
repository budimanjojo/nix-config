{ config, pkgs, ... }:
{
  sops.secrets = {
    adminPassword = {
      sopsFile = ./secret.sops.yaml;
      neededForUsers = true;
    };
  };

  users = {
    mutableUsers = false;
    users.${config.mySystem.adminUser} = {
      isNormalUser = true;
      uid = 1000;
      extraGroups = [ "wheel" ];
      shell = pkgs.fish;
      hashedPasswordFile = config.sops.secrets.adminPassword.path;
    };
    users.test = {
      isNormalUser = true;
    };
  };

  programs.fish.enable = true;
}

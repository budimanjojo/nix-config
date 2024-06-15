{ config, ... }:
{
  config = {
    sops = {
      defaultSopsFile = ./secret.sops.yaml;
      age.keyFile = "/home/${config.deviceCfg.username}/.config/sops/age/keys.txt";
    };
  };
}

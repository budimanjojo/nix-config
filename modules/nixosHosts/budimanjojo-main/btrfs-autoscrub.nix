{
  flake.modules.nixos.budimanjojo-main = {
    mySystem.services.btrfs-autoscrub = {
      enable = true;
      fileSystems = [
        "/"
        "/home"
      ];
    };
  };
}

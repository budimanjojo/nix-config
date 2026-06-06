{
  flake.modules.nixos.budimanjojo-nas = {
    mySystem.services.btrfs-autoscrub = {
      enable = true;
      fileSystems = [
        "/"
        "/nas-data"
      ];
    };
  };
}

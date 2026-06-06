{
  flake.modules.nixos.budimanjojo-firewall = {
    mySystem.services.btrfs-autoscrub = {
      enable = true;
      fileSystems = [ "/" ];
    };
  };
}

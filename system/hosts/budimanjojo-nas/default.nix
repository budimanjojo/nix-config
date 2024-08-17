{ ... }:
{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ./_modules # host specific modules
    ../../profiles/server.nix
  ];

  config = {
    myHardware.cpu = "intel";

    mySystem = {
      programs.nh = {
        enable = true;
        flake = "/home/budiman/Github/dotfiles";
      };
      services.btrfs-autoscrub = {
        enable = true;
        fileSystems = [
          "/"
          "/nas-data"
        ];
      };
    };
  };
}

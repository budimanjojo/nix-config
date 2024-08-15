{ ... }:
{
  imports = [
    ./disk-config.nix
    # to be added once I'm ready to install Nixos on this machine
    # ./hardware-configuration.nix
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

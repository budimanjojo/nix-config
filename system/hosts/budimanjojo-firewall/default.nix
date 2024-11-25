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
        flake = "/home/budiman/Github/nix-config";
      };
      services.btrfs-autoscrub = {
        enable = true;
        fileSystems = [ "/" ];
      };
    };

    services.openssh.listenAddresses = [
      { addr = "192.168.200.1"; }
      { addr = "192.168.50.1"; }
    ];
  };
}

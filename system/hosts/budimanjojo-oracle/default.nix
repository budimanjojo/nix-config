{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./_modules # host specific modules
    ../../profiles/server.nix
  ];

  config = {
    mySystem = {
      programs.nh = {
        enable = true;
        flake = "/home/budiman/Github/nix-config";
      };
    };

    # sshd failed to start on boot when interface is not ready yet
    systemd.services.sshd = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}

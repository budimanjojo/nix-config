{
  flake.modules.nixos.budimanjojo-firewall = {
    services.openssh.listenAddresses = [
      { addr = "192.168.200.1"; }
      { addr = "192.168.50.1"; }
    ];

    # sshd failed to start on boot when interface is not ready yet
    systemd.services.sshd = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}

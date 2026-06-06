{
  flake.modules.nixos.budimanjojo-oracle = {
    # sshd failed to start on boot when interface is not ready yet
    systemd.services.ssh = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}

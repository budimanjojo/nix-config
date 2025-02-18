{ ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    useDHCP = false;
    # TODO: I'll manage the firewall rules from the oracle web UI for now
    firewall.enable = false;
  };
  systemd.network = {
    enable = true;
    networks = {
      "30-enp0s6" = {
        matchConfig.Name = "enp0s6";
        networkConfig.DHCP = "yes";
        linkConfig.RequiredForOnline = "routable";
      };
    };
  };
}

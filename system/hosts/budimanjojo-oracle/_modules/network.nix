{ ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    useDHCP = false;
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

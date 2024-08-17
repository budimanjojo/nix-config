{ ... }:
{
  networking.useDHCP = false;
  # creating a `br0` network bridge that is used for Incus to get IP address from router
  # so our other machines can connect to containers or VM in `external` profile
  systemd.network = {
    enable = true;
    netdevs = {
      "20-br0" = {
        netdevConfig = {
          Name = "br0";
          Description = "virtual network interface with fixed MAC address";
          Kind = "bridge";
          MACAddress = "d0:50:99:25:88:91";
        };
      };
    };

    networks = {
      "20-br0" = {
        matchConfig.Name = "br0";
        networkConfig = {
          Description = "configure br0 to get IP from DHCP server";
          DHCP = true;
        };
        linkConfig.RequiredForOnline = "carrier";
      };
      "20-br0-en" = {
        matchConfig.Name = "en*";
        networkConfig = {
          Description = "add en* interfaces to become member of br0 bridge";
          Bridge = "br0";
        };
        linkConfig.RequiredForOnline = "enslaved";
      };
    };
  };
}

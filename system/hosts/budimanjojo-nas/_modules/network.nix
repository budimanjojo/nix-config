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
          Description = "virtual network interface with MAC address inherited from bridge members";
          Kind = "bridge";
          MACAddress = "none";
        };
      };
    };

    links = {
      "20-br0" = {
        matchConfig.OriginalName = "br0";
        linkConfig = {
          Description = "do not modify the MAC address specified the netdev of br0";
          MACAddressPolicy = "none";
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

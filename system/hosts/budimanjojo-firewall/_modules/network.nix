{ ... }:
{
  networking = {
    domain = "home.arpa";
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    useDHCP = false;
  };
  systemd.network = {
    enable = true;
    wait-online = {
      anyInterface = false;
      ignoredInterfaces = [
        "wan0"
        "wan1"
        "lan1"
        "lan2"
        "ctr0"
        "wg0"
      ];
    };
    links = {
      # rename all interface names to be easier to identify
      "10-wan0" = {
        matchConfig.Path = "pci-0000:03:00.0";
        linkConfig.Name = "wan0";
      };
      "10-wan1" = {
        matchConfig.Path = "pci-0000:05:00.0";
        linkConfig.Name = "wan1";
      };
      "10-lan0" = {
        matchConfig.Path = "pci-0000:06:00.0";
        linkConfig.Name = "lan0";
      };
      "10-lan1" = {
        matchConfig.Path = "pci-0000:07:00.0";
        linkConfig.Name = "lan1";
      };
      "10-lan2" = {
        matchConfig.Path = "pci-0000:08:00.0";
        linkConfig.Name = "lan2";
      };
      "10-lan3" = {
        matchConfig.Path = "pci-0000:09:00.0";
        linkConfig.Name = "lan3";
      };
      "10-wifi0" = {
        matchConfig.Path = "pci-0000:00:14.0-usb-0:8:1.0";
        linkConfig.Name = "wifi0";
      };
    };

    netdevs = {
      # VLANs
      "20-lan0.50" = {
        netdevConfig = {
          Name = "lan0.50";
          Description = "HOME";
          Kind = "vlan";
        };
        vlanConfig.Id = 50;
      };
      "20-lan0.69" = {
        netdevConfig = {
          Name = "lan0.69";
          Description = "IOT";
          Kind = "vlan";
        };
        vlanConfig.Id = 69;
      };
      "20-lan0.200" = {
        netdevConfig = {
          Name = "lan0.200";
          Description = "SERVER";
          Kind = "vlan";
        };
        vlanConfig.Id = 200;
      };
      "20-lan0.250" = {
        netdevConfig = {
          Name = "lan0.250";
          Description = "GUEST";
          Kind = "vlan";
        };
        vlanConfig.Id = 250;
      };
    };

    networks = {
      # Disabled interfaces
      "30-wan1" = {
        matchConfig.Name = "wan1";
        networkConfig.ConfigureWithoutCarrier = true;
        linkConfig.ActivationPolicy = "always-down";
      };
      "30-lan1" = {
        matchConfig.Name = "lan1";
        networkConfig.ConfigureWithoutCarrier = true;
        linkConfig.ActivationPolicy = "always-down";
      };
      "30-lan2" = {
        matchConfig.Name = "lan2";
        networkConfig.ConfigureWithoutCarrier = true;
        linkConfig.ActivationPolicy = "always-down";
      };
      "30-lan3" = {
        matchConfig.Name = "lan3";
        networkConfig.ConfigureWithoutCarrier = true;
        linkConfig.ActivationPolicy = "always-down";
      };
      "30-wifi0" = {
        matchConfig.Name = "wifi0";
        networkConfig.ConfigureWithoutCarrier = true;
        linkConfig.ActivationPolicy = "always-down";
      };

      # WAN0
      "30-wan0" = {
        matchConfig.Name = "wan0";
        networkConfig.DHCP = "yes";
        linkConfig = {
          MTUBytes = "1500";
          RequiredForOnline = "routable";
        };
      };

      # LAN0
      "30-lan0" = {
        matchConfig.Name = "lan0";
        address = [ "192.168.10.1/24" ];
        linkConfig.RequiredForOnline = "carrier";
        vlan = [
          "lan0.50" # HOME
          "lan0.69" # IOT
          "lan0.200" # SERVER
          "lan0.250" # GUEST
        ];
      };

      # HOME VLAN
      "30-lan0.50" = {
        matchConfig.Name = "lan0.50";
        address = [ "192.168.50.1/24" ];
        linkConfig.RequiredForOnline = "routable";
      };

      # IOT VLAN
      "30-lan0.69" = {
        matchConfig.Name = "lan0.69";
        address = [ "192.168.69.1/24" ];
        linkConfig.RequiredForOnline = "routable";
      };

      # SERVER VLAN
      "30-lan0.200" = {
        matchConfig.Name = "lan0.200";
        address = [ "192.168.200.1/24" ];
        linkConfig.RequiredForOnline = "routable";
      };

      # GUEST VLAN
      "30-lan0.250" = {
        matchConfig.Name = "lan0.250";
        address = [ "192.168.250.1/24" ];
        linkConfig.RequiredForOnline = "routable";
      };
    };
  };
}

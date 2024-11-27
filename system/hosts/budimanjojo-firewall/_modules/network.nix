{ ... }:
let
  dhcpServerOptions = {
    PoolOffset = 50;
    PoolSize = 150;
    DefaultLeaseTimeSec = 86400;
    MaxLeaseTimeSec = 86400;
    EmitDNS = "yes";
    DNS = "192.168.10.1";
    SendOption = "15:string:home.arpa"; # domain name for clients
  };

  # [ { dhcpServerStaticLeaseConfig = { Address = <IP>; MACAddress = <MAC>; }; } {...} ]
  mkStaticLeases =
    leases:
    builtins.map (lease: {
      dhcpServerStaticLeaseConfig = {
        Address = lease.addr;
        MACAddress = lease.MAC;
      };
    }) leases;
in
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
        linkConfig.ActivationPolicy = "always-down";
      };
      "30-lan1" = {
        matchConfig.Name = "lan1";
        linkConfig.ActivationPolicy = "always-down";
      };
      "30-lan2" = {
        matchConfig.Name = "lan2";
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
        dhcpServerConfig = dhcpServerOptions;
      };

      # HOME VLAN
      "30-lan0.50" = {
        matchConfig.Name = "lan0.50";
        address = [ "192.168.50.1/24" ];
        linkConfig.RequiredForOnline = "routable";
        networkConfig.DHCPServer = "yes";
        dhcpServerConfig = dhcpServerOptions;
        dhcpServerStaticLeases = mkStaticLeases [
          {
            # jojo-oneplus
            addr = "192.168.50.10";
            MAC = "ac:d6:18:e5:b5:34";
          }
          {
            # lina-samsung
            addr = "192.168.50.11";
            MAC = "ae:9c:e8:65:f4:76";
          }
          {
            # eunice-tablet
            addr = "192.168.50.12";
            MAC = "00:03:f7:bd:70:d0";
          }
          {
            # eugene-oneplus
            addr = "192.168.50.13";
            MAC = "98:09:cf:0c:70:af";
          }
          {
            # firehd-8-livingroom
            addr = "192.168.50.40";
            MAC = "40:a9:cf:3b:a3:7d";
          }
          {
            # raspberry-pi4-tv
            addr = "192.168.50.41";
            MAC = "dc:a6:32:10:60:45";
          }
          {
            # budimanjojo-main
            addr = "192.168.50.49";
            MAC = "b4:2e:99:62:8d:06";
          }
        ];
      };

      # IOT VLAN
      "30-lan0.69" = {
        matchConfig.Name = "lan0.69";
        address = [ "192.168.69.1/24" ];
        linkConfig.RequiredForOnline = "routable";
        networkConfig.DHCPServer = "yes";
        dhcpServerConfig = dhcpServerOptions;
        dhcpServerStaticLeases = mkStaticLeases [
          {
            # broadlink-livingroom-plug
            addr = "192.168.69.10";
            MAC = "34:ea:34:79:f0:91";
          }
          {
            # broadlink-bedroom-rm4c
            addr = "192.168.69.11";
            MAC = "24:df:a7:4f:9a:8e";
          }
          {
            # ezviz-bedroom-camera
            addr = "192.168.69.21";
            MAC = "a0:ff:0c:9f:A7:7a";
          }
        ];
      };

      # SERVER VLAN
      "30-lan0.200" = {
        matchConfig.Name = "lan0.200";
        address = [ "192.168.200.1/24" ];
        linkConfig.RequiredForOnline = "routable";
        networkConfig.DHCPServer = "yes";
        dhcpServerConfig = dhcpServerOptions;
        dhcpServerStaticLeases = mkStaticLeases [
          {
            # budimanjojo-nas
            addr = "192.168.200.30";
            MAC = "d0:50:99:25:88:91";
          }
        ];
      };

      # GUEST VLAN
      "30-lan0.250" = {
        matchConfig.Name = "lan0.250";
        address = [ "192.168.250.1/24" ];
        linkConfig.RequiredForOnline = "routable";
        networkConfig.DHCPServer = "yes";
        dhcpServerConfig = dhcpServerOptions;
      };
    };
  };
}

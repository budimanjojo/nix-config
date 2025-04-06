{ ... }:
let
  leaseOption = {
    valid-lifetime = 86400;
    renew-timer = 43200; # 50% of valid lifetime
    rebind-timer = 75600; # 87.5% of valid lifetime
  };
  commonDhcpOptions = [
    {
      name = "domain-name-servers";
      data = "192.168.10.1";
    }
    {
      name = "time-servers";
      data = "192.168.10.1";
    }
    {
      name = "domain-name";
      data = "home.arpa";
    }
    {
      name = "domain-search";
      data = "home.arpa";
    }
  ];
in
{
  services.kea.dhcp4 = {
    enable = true;
    settings = {
      interfaces-config = {
        interfaces = [
          "lan0"
          "lan0.50"
          "lan0.69"
          "lan0.200"
          "lan0.250"
        ];
      };
      subnet4 = [
        (
          {
            id = 1;
            interface = "lan0";
            subnet = "192.168.10.0/24";
            pools = [ { pool = "192.168.10.50 - 192.168.10.199"; } ];
            option-data = [
              {
                name = "routers";
                data = "192.168.10.1";
              }
              {
                # this allows clients to be discovered by omada-controller
                name = "capwap-ac-v4";
                data = "10.5.0.10";
              }
            ] ++ commonDhcpOptions;
          }
          // leaseOption
        )

        (
          {
            id = 2;
            interface = "lan0.50";
            subnet = "192.168.50.0/24";
            pools = [ { pool = "192.168.50.50 - 192.168.50.199"; } ];
            option-data = [
              {
                name = "routers";
                data = "192.168.10.1";
              }
            ] ++ commonDhcpOptions;
            reservations = [
              {
                hostname = "jojo-poco";
                ip-address = "192.168.50.10";
                hw-address = "e8:5f:b4:2d:ce:5d";
              }
              {
                hostname = "lina-samsung";
                ip-address = "192.168.50.11";
                hw-address = "ae:9c:e8:65:f4:76";
              }
              {
                hostname = "eunice-tablet";
                ip-address = "192.168.50.12";
                hw-address = "00:03:f7:bd:70:d0";
              }
              {
                hostname = "eugene-oneplus";
                ip-address = "192.168.50.13";
                hw-address = "98:09:cf:0c:70:af";
              }
              {
                hostname = "firehd-8-livingroom";
                ip-address = "192.168.50.40";
                hw-address = "40:a9:cf:3b:a3:7d";
              }
              {
                hostname = "raspberry-pi4-tv";
                ip-address = "192.168.50.41";
                hw-address = "dc:a6:32:10:60:45";
              }
              {
                hostname = "budimanjojo-main";
                ip-address = "192.168.50.49";
                hw-address = "b4:2e:99:62:8d:06";
              }
            ];
          }
          // leaseOption
        )

        (
          {
            id = 3;
            interface = "lan0.69";
            subnet = "192.168.69.0/24";
            pools = [ { pool = "192.168.69.50 - 192.168.69.199"; } ];
            option-data = [
              {
                name = "routers";
                data = "192.168.10.1";
              }
            ] ++ commonDhcpOptions;
            reservations = [
              {
                hostname = "broadlink-livingroom-plug";
                ip-address = "192.168.69.10";
                hw-address = "34:ea:34:79:f0:91";
              }
              {
                hostname = "broadlink-bedroom-rm4c";
                ip-address = "192.168.69.11";
                hw-address = "24:df:a7:4f:9a:8e";
              }
              {
                hostname = "ezviz-bedroom-camera";
                ip-address = "192.168.69.21";
                hw-address = "a0:ff:0c:9f:A7:7a";
              }
              {
                hostname = "android-livingroom-tv";
                ip-address = "192.168.69.30";
                hw-address = "8c:90:2d:cd:00:56";
              }
            ];
          }
          // leaseOption
        )

        (
          {
            id = 4;
            interface = "lan0.200";
            subnet = "192.168.200.0/24";
            pools = [ { pool = "192.168.200.50 - 192.168.200.199"; } ];
            option-data = [
              {
                name = "routers";
                data = "192.168.10.1";
              }
            ] ++ commonDhcpOptions;
            reservations = [
              {
                hostname = "budimanjojo-nas";
                ip-address = "192.168.200.30";
                hw-address = "d0:50:99:25:88:91";
              }
            ];
          }
          // leaseOption
        )

        (
          {
            id = 5;
            interface = "lan0.250";
            subnet = "192.168.250.0/24";
            pools = [ { pool = "192.168.250.50 - 192.168.250.199"; } ];
            option-data = [
              {
                name = "routers";
                data = "192.168.10.1";
              }
            ] ++ commonDhcpOptions;
          }
          // leaseOption
        )
      ];
    };
  };
}

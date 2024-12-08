{ ... }:
{
  networking.resolvconf.useLocalResolver = false;
  services.bind = {
    enable = true;
    listenOn = [ "192.168.10.1" ];
    listenOnIpv6 = [ "none" ];
    extraOptions = ''
      port 8853;
    '';
    zones = {
      "home.arpa" = {
        master = true;
        file = ./zones/home.arpa.db;
      };
      "168.192.in-addr.arpa" = {
        master = true;
        file = ./zones/168.192.in-addr.arpa.db;
      };
      "10.in-addr.arpa" = {
        master = true;
        file = ./zones/10.in-addr.arpa.db;
      };
    };
  };
}

{ config, ... }:
{
  sops.secrets."wireguard/privatekey" = {
    sopsFile = ./secret.sops.yaml;
    owner = "systemd-network";
    restartUnits = [ "systemd-networkd.service" ];
  };
  systemd.network = {
    netdevs."50-wg0" = {
      netdevConfig = {
        Name = "wg0";
        Description = "WireGuard";
        Kind = "wireguard";
        MTUBytes = "1420";
      };
      wireguardConfig = {
        PrivateKeyFile = "${config.sops.secrets."wireguard/privatekey".path}";
        ListenPort = 51821;
        RouteTable = "main";
      };
      wireguardPeers = [
        {
          # budimanjojo-firewall
          PublicKey = "ZfOwDdOBpC2bpTp1pQl9Jlr0tBhm6njonXoJGU0xyBM=";
          AllowedIPs = [
            "10.10.10.11/32"
            "192.168.10.0/24" # LAN0 network
            "192.168.50.0/24" # HOME network
            "192.168.69.0/24" # IOT network
            "192.168.200.0/24" # SERVER network
            "192.168.250.0/24" # GUEST network
            "10.5.0.0/24" # CONTAINER network
            "192.168.15.0/24" # k8s LB network
          ];
        }
        {
          # pocof6-phone
          PublicKey = "WCESN/SAmvJekIxJSlmw+2FQg+uhvlseGhGvN/VZ0AU=";
          AllowedIPs = [ "10.10.10.12/32" ];
        }
        {
          # work-pc
          PublicKey = "E+sLt3iBptnj6+7X/9S2ROglx8G3urufr18wCBt8bGQ=";
          AllowedIPs = [ "10.10.10.13/32" ];
        }
        {
          # oneplus6t-phone
          PublicKey = "4g38+3wtUHHlrOCl/HsIM6i8p1QeoWgHtPh7hjcQx10=";
          AllowedIPs = [ "10.10.10.14/32" ];
        }
      ];
    };
    networks."50-wg0" = {
      matchConfig.Name = "wg0";
      address = [ "10.10.10.10/24" ];
      networkConfig = {
        IPMasquerade = "ipv4";
        IPv4Forwarding = true;
      };
    };
  };
}

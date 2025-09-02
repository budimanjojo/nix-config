{ config, ... }:
let
  homeNetworks = [
    "192.168.10.0/24" # LAN0 network
    "192.168.50.0/24" # HOME network
    "192.168.69.0/24" # IOT network
    "192.168.200.0/24" # SERVER network
    "192.168.250.0/24" # GUEST network
    "10.5.0.0/24" # CONTAINER network
    "192.168.15.0/24" # k8s LB network
  ];
in
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
          AllowedIPs = [ "10.10.10.11/32" ] ++ homeNetworks;
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
        {
          # android-livingroom-tv
          PublicKey = "LYF3KLxBtfD1tIy2qS4Rl4COGlBLxFye7OaIUkZtfHM=";
          AllowedIPs = [ "10.10.10.15/32" ];
        }
        {
          # qbit-gluetun
          PublicKey = "U1/0yWmjrRQapq+TWNv0mi1+gJkKkyBmN/ZtJWGbb0k=";
          AllowedIPs = [ "10.10.10.50/32" ];
        }
      ];
    };
    networks = {
      "50-wg0" = {
        matchConfig.Name = "wg0";
        address = [ "10.10.10.10/24" ];
        networkConfig = {
          # IPMasquerade = "ipv4"; # we don't want to masquerade everything
          IPv4Forwarding = true;
        };
      };
      # we need to enable IP forwarding for outbound interface too
      "30-enp0s6".networkConfig.IPv4Forwarding = true;
    };
  };

  # this ensures the source address of peers are correctly forwarded to my
  # firewall server so I can set firewall rules for each peer while peers
  # still have access to the internet acting as this server
  networking.nftables = {
    enable = true;
    tables.wg_nat = {
      family = "ip";
      content = ''
        set home_networks {
          type ipv4_addr
          flags interval
          elements = {
            ${builtins.concatStringsSep ", " homeNetworks}
          }
        }

        chain PREROUTING {
          type nat hook prerouting priority dstnat; policy accept;
          tcp dport 50413 counter dnat to 10.10.10.50 comment "port forward 50413 to qbit-gluetun"
        }

        chain POSTROUTING {
          type nat hook postrouting priority srcnat; policy accept;
          ip saddr 10.10.10.0/24 ip daddr != @home_networks masquerade
        }
      '';
    };
  };
}

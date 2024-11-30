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
      };
      wireguardPeers = [
        {
          # pocof6-phone
          wireguardPeerConfig = {
            PublicKey = "WCESN/SAmvJekIxJSlmw+2FQg+uhvlseGhGvN/VZ0AU=";
            AllowedIPs = [ "10.10.0.2/32" ];
            PersistentKeepalive = 15;
          };
        }
        {
          # work-pc
          wireguardPeerConfig = {
            PublicKey = "E+sLt3iBptnj6+7X/9S2ROglx8G3urufr18wCBt8bGQ=";
            AllowedIPs = [ "10.10.0.3/32" ];
            PersistentKeepalive = 15;
          };
        }
        {
          # oneplus6t-phone
          wireguardPeerConfig = {
            PublicKey = "4g38+3wtUHHlrOCl/HsIM6i8p1QeoWgHtPh7hjcQx10=";
            AllowedIPs = [ "10.10.0.4/32" ];
            PersistentKeepalive = 15;
          };
        }
      ];
    };
    networks."50-wg0" = {
      matchConfig.Name = "wg0";
      address = [ "10.10.0.1/24" ];
      networkConfig.IPMasquerade = "ipv4";
    };
  };
}

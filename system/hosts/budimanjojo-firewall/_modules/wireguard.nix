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
        RouteTable = "main";
      };
      wireguardPeers = [
        {
          # budimanjojo-oracle
          PublicKey = "e71Old3Ax2DEw8QB9yvhyOIIuNJHtp8nBYKJJaDVPkw=";
          AllowedIPs = [ "10.10.10.10/24" ];
          Endpoint = "140.245.111.170:51821";
          PersistentKeepalive = 15;
        }
      ];
    };
    networks."50-wg0" = {
      matchConfig.Name = "wg0";
      address = [ "10.10.10.11/32" ];
    };
  };
}

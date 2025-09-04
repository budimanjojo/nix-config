{ pkgs, ... }:
let
  downloadsDir = "/var/qBittorrent-downloads";
  qbitUser = "qbittorrent";
in
{
  systemd.tmpfiles.settings.qbittorrent = {
    "${downloadsDir}".d = {
      mode = "755";
      user = qbitUser;
      group = qbitUser;
    };
  };

  services.qbittorrent = {
    enable = true;
    package = pkgs.unstable.qbittorrent-nox;
    user = qbitUser;
    group = qbitUser;
    webuiPort = 8080;
    torrentingPort = 60413;
    serverConfig = {
      Preferences = {
        WebUI = {
          AuthSubnetWhitelistEnabled = true;
          AuthSubnetWhitelist = "10.10.10.12/32, 10.10.10.13/32, 192.168.50.49/32";
          ClickjackingProtection = false;
          HostHeaderValidation = false;
          SecureCookie = false;
        };
        Connection.UPnP = false;
      };
      BitTorrent = {
        Session = {
          BTProtocol = "TCP";
          Preallocation = true;
          DefaultSavePath = downloadsDir;
          DisableAutoTMMByDefault = false;
          DisableAutoTMMTriggers = {
            CategorySavePathChanged = false;
            DefaultSavePathChanged = false;
          };
          MaxConnections = -1;
          MaxConnectionsPerTorrent = -1;
          MaxUploads = -1;
          MaxUploadsPerTorrent = -1;
          QueueingSystemEnabled = false;
        };
      };
    };
  };
}

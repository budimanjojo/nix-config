{ ... }:
{
  services.fireqos = {
    enable = true;
    config = ''
      interface wan0 world-in input rate 50mbit
        class calls commit 300kbit
          match ports 3478:3497,16384:16387,16393:16402

        class default

        class torrents
          match port 50413

      interface wan0 world-out output rate 15mbit
        class calls commit 300kbit
          match ports 3478:3497,16384:16387,16393:16402

        class default

        class torrents
          match port 50413
    '';
  };

  systemd.services.fireqos = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };
}

{
  flake.modules.homeManager.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.services.opencloud-client;
    in
    {
      options.myHome.services.opencloud-client = {
        enable = lib.mkEnableOption "OpenCloud client";
      };

      config = lib.mkIf (cfg.enable) {
        systemd.user.services.opencloud-client = {
          Unit = {
            Description = "OpenCloud client";
            After = [ "graphical-session.target" ];
            PartOf = [ "graphical-session.target" ];
          };

          Service = {
            # TODO: not sure why this is needed but it's in the nextcloud-client module
            Environment = [ "PATH=${config.home.profileDirectory}/bin" ];
            ExecStart = "${pkgs.unstable.opencloud-desktop}/bin/opencloud";
            ExecStop = "${pkgs.unstable.opencloud-desktop}/bin/opencloud --quit";
            KillMode = "process";
            Restart = "on-failure";
            RestartSec = "5s";
            NoNewPrivileges = true;
            RestrictRealtime = true;
          };

          Install = {
            WantedBy = [ "graphical-session.target" ];
          };
        };
      };
    };
}

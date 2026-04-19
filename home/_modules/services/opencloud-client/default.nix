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

  config = lib.mkIf cfg.enable {
    systemd.user.services.opencloud-client = {
      Unit = {
        Description = "OpenCloud client";
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };

      Service = {
        Environment = [ "PATH=${config.home.profileDirectory}/bin" ];
        ExecStart = "${pkgs.unstable.opencloud-desktop}/bin/opencloud";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}

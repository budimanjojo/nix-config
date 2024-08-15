{ config, lib, ... }:
let
  cfg = config.mySystem.services.smartd;
in
{
  options.mySystem.services.smartd = {
    enable = lib.mkEnableOption "smartd";
  };

  config = lib.mkIf (cfg.enable) {
    mySystem.programs.msmtp.enable = true;

    services = {
      smartd = {
        enable = true;
        defaults.monitored = ''
          -a -o on -S on -n standby,q -s (S/../.././01|L/../../7/04:002) -W 4,40,45
        '';
        notifications = {
          mail = {
            enable = true;
            sender = "budimanjojo@gmail.com";
            recipient = "budimanjojo@gmail.com";
          };
          wall.enable = false;
        };
      };
    };
  };
}

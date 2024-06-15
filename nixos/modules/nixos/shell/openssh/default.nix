{ lib, config, ... }:
with lib;
let
  cfg = config.modules.shell.openssh;
  deviceCfg = config.deviceCfg;
in
{
  options.modules.shell.openssh = {
    enable = mkEnableOption "openssh";
  };

  config = mkIf cfg.enable {
    services = {
      openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
        };
      };
    };

    users.users.${deviceCfg.username}.openssh = {
      authorizedKeys.keys = deviceCfg.authorizedKeys;
    };
  };
}

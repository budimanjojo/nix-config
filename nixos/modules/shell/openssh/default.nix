{ lib, config, ... }:
with lib;
let
  cfg = config.modules.shell.openssh;
  device = config.modules.device;
in {
  options.modules.shell.openssh = { enable = mkEnableOption "openssh"; };

  config = mkIf cfg.enable {
    services = {
      openssh = {
        enable = true;
        settings = {
          permitRootLogin = "no";
        };
      };
    };

    users.users.${device.username}.openssh = {
      authorizedKeys.keys = device.authorizedKeys;
    };
  };
}

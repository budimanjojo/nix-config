{ config, lib, ... }:
let
  mySystem = config.mySystem;
  cfg = mySystem.services.openssh;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.mySystem.services.openssh = {
    enable = mkEnableOption "openssh";
    authorizedKeys = mkOption {
      type = types.listOf types.singleLineStr;
      default = [ ];
    };
  };

  config = mkIf (cfg.enable) {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    users.users.${mySystem.adminUser}.openssh.authorizedKeys.keys = cfg.authorizedKeys;
  };
}

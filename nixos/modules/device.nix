{ lib, myConfig, ... }:
with lib;
{
  options.deviceCfg = {
    # Options below NEED to be set on each host
    cpu = mkOption {
      type = types.enum ["amd" "intel" "vm"];
    };
    gpu = mkOption {
      type = types.enum ["amd" "intel" "nvidia" "vm"];
    };
    monitors = mkOption {
      type = with types; listOf (attrsOf (either str bool));
      default = [];
    };
    firefoxProfiles = mkOption {
      type = types.attrs;
      default = {
        "" = {
          id = 0;
          name = myConfig.username;
          isDefault = true;
        };
      };
    };
    hasBluetooth = mkOption {
      type = types.bool;
    };
    hasSound = mkOption {
      type = types.bool;
    };
    authorizedKeys = mkOption {
      type = types.listOf types.str;
      default = [];
    };

    # Options below DON't NEED to be set, will be set by automatically
    hostname = mkOption {
      type = types.str;
      default = myConfig.hostname;
    };
    username = mkOption {
      type = types.str;
      default = myConfig.username;
    };
    isWayland = mkOption {
      type = types.bool;
      default = false;
    };
  };
}

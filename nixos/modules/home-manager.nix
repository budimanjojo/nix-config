{ config, lib, options, ... }:
with lib;
{
  options = {
    home = {
      manager = mkOption {
        type = types.attrs;
        default = {};
      };
    };
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      # home.manager is an alias for having to write home-manager.users.<user>
      users.${config.deviceCfg.username} = mkAliasDefinitions options.home.manager;
    };
  };
}

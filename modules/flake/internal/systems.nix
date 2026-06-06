{ lib, config, ... }:
{
  systems = lib.unique (lib.mapAttrsToList (_: v: v.system) (config.nixosHosts // config.homeHosts));
}

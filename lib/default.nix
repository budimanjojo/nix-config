{ lib, ... }:
rec {
  # systemEnabled returns the value of `osConfig.module`
  # returns false if `module` doesn't exist in the `osConfig`
  # will panic if `osConfig.module` is not type of bool
  # I use this to determine if the home module should be enabled depending on the system module
  # for example: `systemEnabled "programs.hyprland.enable" osConfig`
  systemEnabled =
    module: osConfig:
    if (isNixos osConfig) then
      let
        splitted = lib.splitString "." module;
        val = lib.attrByPath splitted false osConfig;
      in
      if (builtins.isBool val) then val else builtins.abort "osConfig.${module} is not type of bool"
    else
      false;

  # isNixos returns true if the provided `osConfig` is not an empty attrset ond not null
  isNixos = set: set != { } && set != null;
}

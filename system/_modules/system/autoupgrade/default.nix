{ config, lib, ... }:
let
  cfg = config.mySystem.system.autoupgrade;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.mySystem.system.autoupgrade = {
    enable = mkEnableOption "system autoUpgrade";
    dates = mkOption {
      type = types.str;
      default = "Sun 13:00";
    };
  };

  config.system.autoUpgrade = mkIf (cfg.enable) {
    enable = true;
    flake = "github:budimanjojo/nix-config";
    flags = [
      "-L" # print build logs
    ];
    dates = cfg.dates;
  };
}

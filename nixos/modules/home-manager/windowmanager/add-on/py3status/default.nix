{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.py3status;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  options.hm-modules.windowmanager.add-on.py3status = { enable = mkEnableOption "py3status"; };

  config = mkIf cfg.enable {
    xdg.configFile."py3status/config".source = ./config;
  };
}

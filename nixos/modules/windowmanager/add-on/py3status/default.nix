{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.py3status;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  options.modules.windowmanager.add-on.py3status = { enable = mkEnableOption "py3status"; };

  config = mkIf cfg.enable {
    home.manager.xdg.configFile."py3status/config".source = ./config;
  };
}

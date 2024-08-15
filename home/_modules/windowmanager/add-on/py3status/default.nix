{ config, lib, ... }:
let
  cfg = config.myHome.windowmanager.add-on.py3status;
in
{
  options.myHome.windowmanager.add-on.py3status = {
    enable = lib.mkEnableOption "py3status";
  };

  config = lib.mkIf (cfg.enable) { xdg.configFile."py3status/config".source = ./config; };
}

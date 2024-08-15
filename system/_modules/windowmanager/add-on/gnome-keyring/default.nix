{ config, lib, ... }:
let
  cfg = config.mySystem.windowmanager.add-on.gnome-keyring;
in
{
  options.mySystem.windowmanager.add-on.gnome-keyring = {
    enable = lib.mkEnableOption "gnome-keyring";
  };

  config = lib.mkIf (cfg.enable) { services.gnome.gnome-keyring.enable = true; };
}

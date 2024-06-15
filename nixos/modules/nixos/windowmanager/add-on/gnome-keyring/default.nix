{ lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.gnome-keyring;
in
{
  options.modules.windowmanager.add-on.gnome-keyring = {
    enable = mkEnableOption "gnome-keyring";
  };

  config = mkIf cfg.enable { services.gnome.gnome-keyring.enable = true; };
}

{
  flake.modules.nixos.core =
    { config, lib, ... }:
    let
      cfg = config.mySystem.windowManager.add-on.gnome-keyring;
    in
    {
      options.mySystem.windowManager.add-on.gnome-keyring = {
        enable = lib.mkEnableOption "gnome-keyring";
      };

      config = lib.mkIf (cfg.enable) { services.gnome.gnome-keyring.enable = true; };
    };
}

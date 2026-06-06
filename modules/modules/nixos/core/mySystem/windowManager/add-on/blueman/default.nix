{
  flake.modules.nixos.core =
    { config, lib, ... }:
    let
      cfg = config.mySystem.windowManager.add-on.blueman;
    in
    {
      options.mySystem.windowManager.add-on.blueman = {
        enable = lib.mkEnableOption "Blueman";
      };

      config = lib.mkIf (cfg.enable) { services.blueman.enable = true; };
    };
}

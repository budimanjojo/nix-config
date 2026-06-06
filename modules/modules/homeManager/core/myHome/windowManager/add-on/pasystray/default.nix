{
  flake.modules.homeManager.core =
    { config, lib, ... }:
    let
      cfg = config.myHome.windowManager.add-on.pasystray;
    in
    {
      options.myHome.windowManager.add-on.pasystray = {
        enable = lib.mkEnableOption "pasystray";
      };

      config = lib.mkIf (cfg.enable) { services.pasystray.enable = true; };
    };
}

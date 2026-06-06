{
  flake.modules.homeManager.core =
    { config, lib, ... }:
    let
      cfg = config.myHome.windowManager.add-on.blueman-applet;
    in
    {
      options.myHome.windowManager.add-on.blueman-applet = {
        enable = lib.mkEnableOption "blueman-applet";
      };

      config = lib.mkIf (cfg.enable) { services.blueman-applet.enable = true; };
    };
}

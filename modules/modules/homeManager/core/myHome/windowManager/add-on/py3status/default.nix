{
  flake.modules.homeManager.core =
    { config, lib, ... }:
    let
      cfg = config.myHome.windowManager.add-on.py3status;
    in
    {
      options.myHome.windowManager.add-on.py3status = {
        enable = lib.mkEnableOption "py3status";
      };

      config = lib.mkIf (cfg.enable) { xdg.configFile."py3status/config".source = ./config; };
    };
}

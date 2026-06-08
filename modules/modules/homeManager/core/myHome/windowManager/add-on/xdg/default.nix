{
  flake.modules.homeManager.core =
    { config, lib, ... }:
    let
      cfg = config.myHome.windowManager.add-on.xdg;
    in
    {
      options.myHome.windowManager.add-on.xdg = {
        enable = lib.mkEnableOption "xdg";
      };

      config = lib.mkIf (cfg.enable) {
        xdg.userDirs = {
          enable = true;
          createDirectories = true;
          setSessionVariables = true;
        };
      };
    };
}

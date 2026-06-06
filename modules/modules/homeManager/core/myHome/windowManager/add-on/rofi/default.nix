{
  flake.modules.homeManager.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.windowManager.add-on.rofi;
    in
    {
      options.myHome.windowManager.add-on.rofi = {
        enable = lib.mkEnableOption "rofi";
      };

      config = lib.mkIf (cfg.enable) {
        programs.rofi = {
          enable = true;
          extraConfig = {
            font = "UbuntuMono Nerd Font 12";
            display-drun = " ";
            show-icons = true;
            drun-display-format = "{name}";
            disable-history = false;
            sidebar-mode = false;
          };
          theme = ./style.rasi;
        };
      };
    };
}

{
  flake.modules.homeManager.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.myHome.windowManager.add-on.gtk-theme;
    in
    {
      options.myHome.windowManager.add-on.gtk-theme = {
        enable = lib.mkEnableOption "gtk-theme";
      };

      config = lib.mkIf (cfg.enable) {
        home.pointerCursor = {
          package = pkgs.catppuccin-cursors.mochaMauve;
          name = "catppuccin-mocha-mauve-cursors";
          size = 24;
          gtk.enable = true;
          x11.enable = true;
        };
        gtk = {
          enable = true;
          font = {
            name = "UbuntuMono Nerd Font";
            package = pkgs.nerd-fonts.ubuntu-mono;
            size = 12;
          };
          theme = {
            name = "Tokyonight-Dark";
            package = pkgs.tokyonight-gtk-theme;
          };
          iconTheme = {
            name = "Tokyonight-Dark";
            package = pkgs.thisflake.tokyonight-icon-theme;
          };
        };
      };
    };
}

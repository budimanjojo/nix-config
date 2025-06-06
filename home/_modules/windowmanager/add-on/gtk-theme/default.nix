{
  config,
  lib,
  pkgs,
  myPkgs,
  ...
}:
let
  cfg = config.myHome.windowmanager.add-on.gtk-theme;
in
{
  options.myHome.windowmanager.add-on.gtk-theme = {
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
        package = myPkgs.tokyonight-gtk-theme;
      };
      iconTheme = {
        name = "Tokyonight-Dark";
        package = myPkgs.tokyonight-icon-theme;
      };
    };
  };
}

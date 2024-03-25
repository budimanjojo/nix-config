{ pkgs, lib, config, myPkgs, ... }:
with lib;
let
  cfg = config.hm-modules.windowmanager.add-on.gtk-theme;
in {
  options.hm-modules.windowmanager.add-on.gtk-theme = { enable = mkEnableOption "gtk-theme"; };

  config = mkIf cfg.enable {
    home.pointerCursor = {
      package = pkgs.vimix-cursor-theme;
      name = "Vimix-Cursors";
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
    gtk = {
      enable = true;
      font = {
        name = "UbuntuMono Nerd Font";
        package = pkgs.nerdfonts.override { fonts = [ "UbuntuMono" ]; };
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

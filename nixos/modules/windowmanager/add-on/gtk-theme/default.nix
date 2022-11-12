{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.gtk-theme;
  packages = pkgs // config.nur.repos.ambroisie // pkgs.callPackage ./custom-packages.nix {};
in {
  options.modules.windowmanager.add-on.gtk-theme = { enable = mkEnableOption "gtk-theme"; };

  config = mkIf cfg.enable {
    home.manager = {
      gtk = {
        enable = true;
        cursorTheme = {
          name = "Vimix Cursors";
          package = packages.vimix-cursors;
        };
        font = {
          name = "UbuntuMono Nerd Font";
          package = pkgs.nerdfonts.override { fonts = [ "UbuntuMono" ]; };
          size = 12;
        };
        theme = {
          name = "Tokyonight-Dark-B";
          package = packages.tokyonight-gtk-theme;
        };
        iconTheme = {
          name = "Tokyonight-Dark";
          package = packages.tokyonight-icon-theme;
        };
      };

      # TODO: This is needed for Gnome42 apps
      xdg.configFile."gtk-4.0/gtk.css".source = "${packages.tokyonight-gtk-theme}/share/themes/Gnome42/Tokyonight-Dark-B.css";
    };
  };
}

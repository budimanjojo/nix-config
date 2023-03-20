{ pkgs, lib, config, myPkgs, inputs, ... }:
with lib;
let 
  cfg = config.modules.windowmanager.hyprland;
  device = config.modules.device;
in {
  options.modules.windowmanager.hyprland = { enable = mkEnableOption "hyprland"; };

  config = mkIf cfg.enable {
    modules.device.isWayland = true;

    modules.windowmanager.add-on.blueman-applet.enable = true;
    modules.windowmanager.add-on.dunst.enable = true;
    modules.windowmanager.add-on.gnome-keyring.enable = true;
    modules.windowmanager.add-on.gtk-theme.enable = true;
    modules.windowmanager.add-on.nm-applet.enable = true;
    modules.windowmanager.add-on.polkit-gnome.enable = true;
    modules.windowmanager.add-on.pasystray.enable = true;
    modules.windowmanager.add-on.rofi.enable = true;
    modules.windowmanager.add-on.swayidle.enable = true;
    modules.windowmanager.add-on.thunar.enable = true;
    modules.windowmanager.add-on.waybar.enable = true;
    modules.windowmanager.add-on.xdg.enable = true;
    modules.system.font.enable = true;
    modules.system.sound.enable = true;
    modules.system.video.enable = true;
    modules.terminal-emulator.wezterm.enable = true;

    assertions = [
      {
        assertion = length device.monitors > 0;
        message = ''
          At least one monitor in the `config.modules.device.monitors` is
          needeed to use Hyprland module.
        '';
      }
    ];

    services.xserver = {
      enable = true;
      displayManager = {
        autoLogin.enable = true;
        defaultSession = "hyprland";
        sddm = {
          enable = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      at-spi2-core
      libappindicator-gtk3
      libappindicator-gtk2
      libappindicator
      wl-clipboard
      xdg-utils
    ] ++ [
      myPkgs.configure-gtk
      myPkgs.rofi-firefox-wrapper
    ];

    programs.hyprland.enable = true;

    services.dbus.enable = true;
    networking.networkmanager.enable = true;

    home.manager = {
      imports = [ inputs.hyprland.homeManagerModules.default ];
      xdg.configFile."hypr/wallpapers".source = ./wallpapers;
      xdg.configFile."hypr/sounds".source = ./sounds;
      xdg.configFile."hypr/configs".source = ./configs;

      wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = import ./config.nix { inherit lib device pkgs; };
      };

      home.packages = with pkgs; [
        grim
        slurp
      ];
    };
  };
}

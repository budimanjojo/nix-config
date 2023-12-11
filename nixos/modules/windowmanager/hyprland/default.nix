{ pkgs, lib, config, myPkgs, inputs, system, ... }:
with lib;
let 
  cfg = config.modules.windowmanager.hyprland;
  deviceCfg = config.deviceCfg;
in {
  options.modules.windowmanager.hyprland = { enable = mkEnableOption "hyprland"; };

  config = mkIf cfg.enable {
    deviceCfg.isWayland = true;

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
    modules.terminal-emulator.alacritty.enable = true;

    assertions = [
      {
        assertion = length deviceCfg.monitors > 0;
        message = ''
          At least one monitor in the `config.deviceCfg.monitors` is
          needed to use Hyprland module.
        '';
      }
    ];

    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "${inputs.hyprland.packages.${system}.hyprland}/bin/Hyprland";
        };
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${inputs.hyprland.packages.${system}.hyprland}/bin/Hyprland";
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
        extraConfig = import ./config.nix { inherit lib  pkgs;deviceCfg = deviceCfg; };
      };

      home.packages = with pkgs; [
        grim
        slurp
      ];
      systemd.user.startServices = "sd-switch";
    };
  };
}

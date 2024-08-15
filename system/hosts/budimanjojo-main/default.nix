{ ... }:
let
  pubkeys = import ../../pubkeys;
in
{
  imports = [
    ./hardware-configuration.nix

    ../../profiles/workstation-hyprland.nix
    ../../profiles/gaming.nix
    ../../profiles/work.nix
    ../budimanjojo-nas/_modules/incus.nix
  ];

  config = {
    myHardware = {
      cpu = "amd";
      gpuDriver = "nvidia";
      monitors = [
        {
          name = "HDMI-A-1";
          xname = "HDMI-0";
          width = 1920;
          height = 1080;
          wallpaper = ./wallpapers/tokyonight01-left.png;
          workspaces = [
            1
            3
            5
            7
            9
          ];
        }
        {
          name = "DP-1";
          width = 1920;
          height = 1080;
          primary = true;
          x = 1920;
          wallpaper = ./wallpapers/tokyonight01-right.png;
          workspaces = [
            2
            4
            6
            8
            10
          ];
        }
      ];
    };

    mySystem = {
      displaymanager.sddm.wallpaper = ./wallpapers/tokyonight01-left.png;
      services.smartd.enable = true;
      programs.nh = {
        enable = true;
        flake = "/home/budiman/Github/dotfiles";
      };

      services = {
        btrfs-autoscrub = {
          enable = true;
          fileSystems = [
            "/"
            "/home"
          ];
        };
        openssh = {
          enable = true;
          authorizedKeys = [
            pubkeys.work-pc
            pubkeys.op9-termux
          ];
        };
      };
    };
  };
}

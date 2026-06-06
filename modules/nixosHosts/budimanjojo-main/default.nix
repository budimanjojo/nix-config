{ self, ... }:
{
  nixosHosts.budimanjojo-main = {
    system = "x86_64-linux";
    homeUsers = [ "budiman" ];

    hardware = {
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
  };

  flake.modules = {
    nixos.budimanjojo-main.imports = with self.modules.nixos; [
      hyprland
      gaming
      work
    ];

    homeManager."budiman@budimanjojo-main".imports = with self.modules.homeManager; [
      hyprland
      extra-gaming
      extra-graphics
      extra-utilities
    ];
  };
}

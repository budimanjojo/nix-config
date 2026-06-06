{ self, ... }:
{
  flake.modules.homeManager.hyprland = {
    imports = [ self.modules.homeManager.workstation-common ];

    myHome.windowManager.hyprland.enable = true;
  };
}

{ self, ... }:
{
  flake.modules.nixos.hyprland = {
    imports = [ self.modules.nixos.workstation-common ];

    mySystem.windowManager.hyprland.enable = true;
  };
}

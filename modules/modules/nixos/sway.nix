{ self, ... }:
{
  flake.modules.nixos.sway = {
    imports = [ self.modules.nixos.workstation-common ];

    mySystem.windowManager.sway.enable = true;
  };
}

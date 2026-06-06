{ self, ... }:
{
  flake.modules.nixos.i3 = {
    imports = [ self.modules.nixos.workstation-common ];

    mySystem.windowManager.i3.enable = true;
  };
}

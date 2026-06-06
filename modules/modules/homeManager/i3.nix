{ self, ... }:
{
  flake.modules.homeManager.i3 = {
    imports = [ self.modules.homeManager.workstation-common ];

    myHome.windowManager.i3.enable = true;
  };
}

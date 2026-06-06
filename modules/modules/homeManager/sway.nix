{ self, ... }:
{
  flake.modules.homeManager.sway = {
    imports = [ self.modules.homeManager.workstation-common ];

    myHome.windowManager.sway.enable = true;
  };
}

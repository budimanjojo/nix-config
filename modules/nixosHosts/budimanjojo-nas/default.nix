{ self, ... }:
{
  nixosHosts.budimanjojo-nas = {
    system = "x86_64-linux";
    homeUsers = [ "budiman" ];
    hardware.cpu = "intel";
  };

  flake.modules = {
    nixos.budimanjojo-nas.imports = [ self.modules.nixos.server ];

    homeManager."budiman@budimanjojo-nas".imports = [ self.modules.homeManager.server ];
  };
}

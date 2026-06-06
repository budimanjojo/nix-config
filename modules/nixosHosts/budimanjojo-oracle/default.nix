{ self, ... }:
{
  nixosHosts.budimanjojo-oracle = {
    system = "aarch64-linux";
    homeUsers = [ "budiman" ];
  };

  flake.modules = {
    nixos.budimanjojo-oracle.imports = [ self.modules.nixos.server ];

    homeManager."budiman@budimanjojo-oracle".imports = [ self.modules.homeManager.server ];
  };
}

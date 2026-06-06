{ self, ... }:
{
  nixosHosts.budimanjojo-firewall = {
    system = "x86_64-linux";
    hardware.cpu = "intel";
    homeUsers = [ "budiman" ];
  };

  flake.modules = {
    nixos.budimanjojo-firewall.imports = [ self.modules.nixos.server ];

    homeManager."budiman@budimanjojo-firewall".imports = [ self.modules.homeManager.server ];
  };
}

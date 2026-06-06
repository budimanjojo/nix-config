{ self, ... }:
{
  flake.modules.nixos.hm-integration =
    { inputs, hardware, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
          inherit inputs hardware;
        };
        sharedModules = [
          self.modules.homeManager.core
        ];
      };
    };
}

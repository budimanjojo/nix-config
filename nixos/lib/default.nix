{ self, inputs, ... }: let
  # lib = inputs.nixpkgs.lib;
  inherit (inputs.nixpkgs) lib;
in {
  mkNixosSystem = system: hostname: username:
    lib.nixosSystem {
      inherit system;
      modules = [
        {
          _module.args = {
            inherit self inputs system;
            myConfig = { hostname = hostname; username = username; };
            myPkgs = self.legacyPackages.${system};
          };
        }
        inputs.home-manager.nixosModules.home-manager
        inputs.nur.nixosModules.nur
        inputs.agenix.nixosModule
        # Load the modules
        ../modules
        # Default configuration
        ../hosts/configuration.nix
        # Host specific configuration
        ../hosts/${hostname}/configuration.nix
        # Host specific hardware configuration
        ../hosts/${hostname}/hardware-configuration.nix
      ];
    };
}

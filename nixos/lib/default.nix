{ inputs, ... }: let
  inherit (inputs.nixpkgs) lib;
in {
  mkNixosSystem = system: hostname: username:
    lib.nixosSystem {
      inherit system;
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import ../packages/overlay.nix {inherit inputs system;})
        ];
      };
      modules = [
        {
          _module.args = {
            inherit inputs system;
            myConfig = { hostname = hostname; username = username; };
            nvfetcherPath = ../packages/_sources/generated.nix;
            myPkgs = inputs.self.legacyPackages.${system};
            pkgs-stable = import inputs.nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
              overlays = [ (import ../packages/overlay.nix {inherit inputs system;}) ];
            };
          };
        }
        inputs.sops-nix.nixosModules.sops
        inputs.nh.nixosModules.default
        # Load the modules
        ../modules/nixos
        # Default configuration
        ../hosts/nixos-configuration.nix
        # Host specific configuration
        ../hosts/${hostname}/nixos-configuration.nix
        ../hosts/${hostname}/shared-configuration.nix
        # Host specific hardware configuration
        ../hosts/${hostname}/hardware-configuration.nix
      ];
    };
  mkHome = system: hostname: username:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import ../packages/overlay.nix {inherit inputs system;})
        ];
      };
      modules = [
        {
          _module.args = {
            inherit inputs system;
            myConfig = { hostname = hostname; username = username; };
            nvfetcherPath = ../packages/_sources/generated.nix;
            myPkgs = inputs.self.legacyPackages.${system};
            pkgs-stable = import inputs.nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
              overlays = [ (import ../packages/overlay.nix {inherit inputs system;}) ];
            };
          };
        }
        inputs.nur.nixosModules.nur
        inputs.sops-nix.homeManagerModules.sops
        # Load the home-manager modules
        ../modules/home-manager
        # Default configurations
        ../hosts/hm-configuration.nix
        # Host specific configurations
        ../hosts/${hostname}/shared-configuration.nix
        ../hosts/${hostname}/hm-configuration.nix
      ];
    };
}

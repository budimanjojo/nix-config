{ inputs, ... }:
let
  inherit (inputs.nixpkgs) lib;
  overlayAttrs = import ../overlays { inherit inputs; };
in
{
  mkNixosSystem =
    system: hostname: username:
    lib.nixosSystem {
      inherit system;
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = builtins.attrValues overlayAttrs;
      };
      modules = [
        {
          _module.args = {
            inherit inputs system;
            myConfig = {
              hostname = hostname;
              username = username;
            };
            nvfetcherPath = ../packages/_sources/generated.nix;
            myPkgs = inputs.self.legacyPackages.${system};
          };
        }
        inputs.sops-nix.nixosModules.sops
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
  mkHome =
    system: hostname: username:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = builtins.attrValues overlayAttrs;
      };
      modules = [
        {
          _module.args = {
            inherit inputs system;
            myConfig = {
              hostname = hostname;
              username = username;
            };
            nvfetcherPath = ../packages/_sources/generated.nix;
            myPkgs = inputs.self.legacyPackages.${system};
          };
        }
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

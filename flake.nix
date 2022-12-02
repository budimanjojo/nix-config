{
  description = "My NixOS configurations IaC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    homeage.url = "github:jordanisaacs/homeage";
    homeage.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, ... }@inputs:
    let
      lib = inputs.nixpkgs.lib;

      mkNixosSystem = system: hostname: username:
        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs self;
            myConfig = { hostname = hostname; username = username; };
          };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.nur.nixosModules.nur
            inputs.agenix.nixosModule
            # Load the modules
            ./nixos/modules
            # Default configuration
            ./nixos/hosts/configuration.nix
            # Host specific configuration
            ./nixos/hosts/${hostname}/configuration.nix
            # Host specific hardware configuration
            ./nixos/hosts/${hostname}/hardware-configuration.nix
          ];
        };
    in
    inputs.flake-parts.lib.mkFlake { inherit self; } {
      systems = [ "x86_64-linux" ];
      perSystem = {
        inputs',
        pkgs,
        ...
      }: {
        packages = import ./nixos/packages { inherit inputs' pkgs self; };
      };

      flake.nixosConfigurations = {
        budimanjojo-vm = mkNixosSystem "x86_64-linux" "budimanjojo-vm" "budiman";
        budimanjojo-main = mkNixosSystem "x86_64-linux" "budimanjojo-main" "budiman";
      };
    };
}

{
  description = "My NixOS configurations IaC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    homeage.url = "github:jordanisaacs/homeage";
    homeage.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, agenix, home-manager, homeage, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      lib = nixpkgs.lib;

      mkNixosSystem = pkgs: hostname: username:
        lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            myConfig = { hostname = hostname; username = username; };
          };
          modules = [
            home-manager.nixosModules.home-manager
            nur.nixosModules.nur
            agenix.nixosModule
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
    {
      nixosConfigurations = {
        budimanjojo-vm = mkNixosSystem inputs.nixpkgs "budimanjojo-vm" "budiman";
        budimanjojo-main = mkNixosSystem inputs.nixpkgs "budimanjojo-main" "budiman";
      };
    };
}

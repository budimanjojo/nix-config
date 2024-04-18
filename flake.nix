{
  description = "My NixOS configurations IaC";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-22.11";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    homeage.url = "github:jordanisaacs/homeage";
    homeage.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    talhelper.url = "github:budimanjojo/talhelper";
    talhelper.inputs.nixpkgs.follows = "nixpkgs";
    nh.url = "github:viperML/nh";
    nvfetcher.url = "github:berberman/nvfetcher";
    nvfetcher.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { flake-parts, ... }@inputs:
    let
      myLib = import ./nixos/lib/default.nix { inherit inputs; };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        {
          inputs',
          pkgs,
          self',
          ...
        }:
        let
          nixvim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
            extraSpecialArgs = {
              myPkgs = self'.legacyPackages;
            };
            module = {
              imports = [ ./nixos/modules/home-manager/editor/neovim/configs ];
            };
          };
        in
        {
          packages.neovim = nixvim;
          legacyPackages = import ./nixos/packages { inherit inputs' pkgs; };
          devShells.default = import ./nixos/packages/shell.nix { inherit inputs' pkgs; };
        };

      flake.nixosConfigurations = {
        budimanjojo-vm = myLib.mkNixosSystem "x86_64-linux" "budimanjojo-vm" "budiman";
        budimanjojo-main = myLib.mkNixosSystem "x86_64-linux" "budimanjojo-main" "budiman";
      };

      flake.homeConfigurations = {
        "budiman@budimanjojo-main" = myLib.mkHome "x86_64-linux" "budimanjojo-main" "budiman";
        "budiman@budimanjojo-ubuntu" = myLib.mkHome "x86_64-linux" "budimanjojo-ubuntu" "budiman";
      };
    };
}

{ inputs, mkPkgsWithSystem }:
let
  # my own custom lib will be accessible with `lib.myLib.<name>`
  lib = inputs.nixpkgs.lib.extend (final: prev: { myLib = import ./lib { lib = final; }; });

  # This module is passed to all `nixosConfigurations` and `homeConfigurations` so I can
  # specify whether a machine should be built and pushed on CI or not
  ghMatrixModules =
    {
      config,
      lib,
      system,
      ...
    }:
    let
      cfg = config.ghMatrix;
      inherit (lib) mkOption types;

      defaultRunners = {
        x86_64-linux = "ubuntu-24.04";
        aarch64-linux = "ubuntu-24.04-arm";
        x86_64-darwin = "macos-13";
        aarch64-darwin = "macos-14";
      };
    in
    {
      options.ghMatrix = {
        enable = mkOption {
          type = types.bool;
          default = true;
        };
        system = mkOption {
          type = types.str;
          default = system;
          readOnly = true;
        };
        runner = mkOption {
          type = types.oneOf [
            types.str
            (types.listOf types.str)
          ];
          default = defaultRunners.${cfg.system};
        };
      };
    };
in
{
  mkGithubMatrix =
    {
      nixosConfigurations ? { },
      homeConfigurations ? { },
    }:
    let
      matrixSet = name: cfg: {
        system = cfg.config.ghMatrix.system;
        runner = cfg.config.ghMatrix.runner;
        attrset =
          if cfg.config ? system && cfg.config.system ? build then
            "nixosConfigurations.${name}.config.system.build.toplevel"
          else if cfg ? activationPackage then
            "homeConfigurations.${name}.activationPackage"
          else
            throw "${name} is neither `nixosConfigurations` or `homeConfigurations`";
      };

      filterAttr = attr: lib.filterAttrs (n: v: v.config.ghMatrix.enable) attr;
      mkList = attr: cfgs: builtins.attrValues (builtins.mapAttrs attr cfgs);
      result.include = mkList matrixSet (filterAttr (nixosConfigurations // homeConfigurations));
    in
    result;

  mkSystem =
    {
      hostname,
      adminUser ? "budiman", # default user to login with `sudo` access
      system ? "x86_64-linux",
      nixpkgs ? inputs.nixpkgs,
      # myPkgs defaulted to the `legacyPackages` from this flake
      myPkgs ? inputs.self.legacyPackages.${system},
      # homeUsers is list of home-manager users for the host
      # each user needs a `./home-manager/<name>/default.nix` file present
      # set it to empty list to disable home-manager altogether for the host
      homeUsers ? [ adminUser ],
      # baseModules is the base of the entire machine building
      baseModules ? [
        inputs.sops-nix.nixosModules.sops
        inputs.home-manager.nixosModules.home-manager
        inputs.catppuccin.nixosModules.catppuccin
        ./system/_modules # all machines get my own NixOS modules
        ./system/hosts # entrypoint to all machines
        {
          config = {
            mySystem = {
              adminUser = adminUser;
            };
          };
        }
      ],
      # extraModules is additional modules you want to add for the host
      extraModules ? [ ],
    }:
    let
      mkHomeUsers = lib.optionals (homeUsers != [ ]) [
        {
          config.home-manager = {
            users = builtins.listToAttrs (
              builtins.map (name: {
                name = name;
                value = {
                  imports = [ ./home/${name} ];
                  config.myHome = {
                    username = name;
                  };
                };
              }) homeUsers
            );
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs myPkgs hostname;
            };
            sharedModules = [
              inputs.sops-nix.homeManagerModules.sops
              inputs.catppuccin.homeModules.catppuccin
              ./home/_modules # all users get my own home-manager modules
            ];
          };
        }
      ];
    in
    nixpkgs.lib.nixosSystem {
      inherit system lib;
      pkgs = mkPkgsWithSystem system;
      specialArgs = {
        inherit
          inputs
          myPkgs
          hostname
          system
          ;
      };
      modules = baseModules ++ extraModules ++ mkHomeUsers ++ [ ghMatrixModules ];
    };

  mkHome =
    {
      hostname,
      username ? "budiman",
      system ? "x86_64-linux",
      nixpkgs ? inputs.nixpkgs,
      # myPkgs defaulted to the `legacyPackages` from this flake
      myPkgs ? inputs.self.legacyPackages.${system},
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit lib;
      pkgs = mkPkgsWithSystem system;
      extraSpecialArgs = {
        inherit
          inputs
          myPkgs
          hostname
          system
          ;
        # need to have this because a lot of my modules depends on `osConfig` argument
        osConfig = { };
      };
      modules = [
        inputs.sops-nix.homeManagerModules.sops
        inputs.catppuccin.homeModules.catppuccin
        ./home/_modules # all users get my own home-manager modules
        {
          imports = [ ./home/${username} ];
          config.myHome.username = username;
        }
        ghMatrixModules
      ];
    };
}

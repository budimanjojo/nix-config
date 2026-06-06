{
  description = "My NixOS configurations IaC";

  inputs = {
    # nixpkgs and unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # flake-parts - very lightweight flake framework
    # https://flake.parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    # home-manager - home user modules
    # https://github.com/nix-community/home-manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # sops-nix - secrets with `sops`
    # https://github.com/Mic92/sops-nix
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # Disko - declarative disk partitioning and formatting
    # https://github.com/nix-community/disko
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs-unstable";

    # NUR - Nix User Repository
    # https://github.com/nix-community/NUR
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nur.inputs.flake-parts.follows = "flake-parts";

    # nvfetcher - tool to automate nix package updates
    # https://github.com/berberman/nvfetcher
    nvfetcher.url = "github:berberman/nvfetcher";
    nvfetcher.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nvfetcher.inputs.flake-utils.follows = "flake-utils";

    # nixvim - Neovim distribution built around Nix modules
    # https://github.com/nix-community/nixvim
    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.inputs.flake-parts.follows = "flake-parts";
    nixvim.inputs.systems.follows = "systems";
    nixvim.inputs.nuschtosSearch.follows = "nuschtosSearch";

    # Talhelper - A tool to help creating Talos Kubernetes cluster
    # https://github.com/budimanjojo/talhelper
    talhelper.url = "github:budimanjojo/talhelper";
    talhelper.inputs.nixpkgs.follows = "nixpkgs-unstable";
    talhelper.inputs.flake-parts.follows = "flake-parts";

    import-tree.url = "github:denful/import-tree";

    # Catppuccin for Nix - Soothing pastel theme for Nix
    # https://github.com/catppuccin/nix
    catppuccin.url = "github:catppuccin/nix/release-25.11";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";

    # nixGL - A wrapper tool for Nix OpenGL application
    # https://github.com/nix-community/nixGL
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.inputs.flake-utils.follows = "flake-utils";

    # cache-nix-action - Cache Nix Store in GitHub Actions
    # https://github.com/nix-community/cache-nix-action
    cache-nix-action.url = "github:nix-community/cache-nix-action";
    cache-nix-action.flake = false;

    # these are just dependencies needed for other flakes above
    systems.url = "github:nix-systems/default";
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.systems.follows = "systems";
    nuschtosSearch.url = "github:nuschtOS/search";
    nuschtosSearch.inputs.nixpkgs.follows = "nixpkgs";
    nuschtosSearch.inputs.flake-utils.follows = "flake-utils";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}

{ inputs', pkgs, ... }: {
  figlet = inputs'.nixpkgs.legacyPackages.figlet;
  talhelper = pkgs.callPackage ./talhelper/default.nix {};
}

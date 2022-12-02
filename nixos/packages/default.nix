{ inputs', pkgs, ... }: {
  talhelper = pkgs.callPackage ./talhelper/default.nix {};
}

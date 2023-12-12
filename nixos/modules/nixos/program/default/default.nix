{ pkgs, lib, config, ... }:

{
  imports = [
    ./gaming.nix
    ./tui-utils.nix
  ];
}

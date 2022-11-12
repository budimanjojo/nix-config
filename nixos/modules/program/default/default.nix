{ pkgs, lib, config, ... }:

{
  imports = [
    ./gaming.nix
    ./gui-utils.nix
    ./media.nix
    ./tui-utils.nix
  ];
}

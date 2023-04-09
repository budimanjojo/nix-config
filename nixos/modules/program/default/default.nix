{ pkgs, lib, config, ... }:

{
  imports = [
    ./gaming.nix
    ./graphic.nix
    ./gui-utils.nix
    ./media.nix
    ./tui-utils.nix
  ];
}

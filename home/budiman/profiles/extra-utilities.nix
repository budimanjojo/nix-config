{ pkgs, ... }:
{
  config.home.packages = with pkgs; [
    gparted
    eog
    totem
    rhythmbox
  ];
}

{ pkgs, ... }:
{
  config.home.packages = with pkgs; [
    gparted
    gnome.eog
    gnome.totem
    rhythmbox
  ];
}

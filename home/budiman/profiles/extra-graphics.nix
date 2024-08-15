{ pkgs, ... }:
{
  config.home.packages = with pkgs; [
    gimp
    inkscape
  ];
}

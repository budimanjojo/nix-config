{
  flake.modules.homeManager.extra-graphics =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gimp
        inkscape
      ];
    };
}

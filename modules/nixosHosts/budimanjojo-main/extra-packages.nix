{
  flake.modules.homeManager."budiman@budimanjojo-main" =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.hugo ];
    };
}

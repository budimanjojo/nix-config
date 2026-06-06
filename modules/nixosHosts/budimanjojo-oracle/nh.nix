{
  flake.modules.nixos.budimanjojo-oracle = {
    mySystem.programs.nh = {
      enable = true;
      flake = "/home/budiman/nix-config";
    };
  };
}

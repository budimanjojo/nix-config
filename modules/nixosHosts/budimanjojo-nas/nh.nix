{
  flake.modules.nixos.budimanjojo-nas = {
    mySystem.programs.nh = {
      enable = true;
      flake = "/home/budiman/dotfiles";
    };
  };
}

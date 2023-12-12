{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.shell.fish;
in {
  options.modules.shell.fish = { enable = mkEnableOption "fish"; };

  config = mkIf cfg.enable {
    # Needed for packages completions
    programs.fish.enable = true;
  };
}

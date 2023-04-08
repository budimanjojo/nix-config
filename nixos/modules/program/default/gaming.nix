{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.program.gaming;
in {
  options.modules.program.gaming = { enable = mkEnableOption "default gaming"; };

  config = mkIf cfg.enable {
    programs.gamemode.enable = true;

    home.manager.home.packages = with pkgs; [
      (retroarch.override {
        cores = [
          libretro.mesen
          libretro.fceumm
        ];
      })
      libretro.mesen
      libretro.fceumm
    ];
  };
}

{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.program.gaming;
in {
  options.hm-modules.program.gaming = { enable = mkEnableOption "default gaming"; };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
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

{ pkgs, ... }:
{
  config = {
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

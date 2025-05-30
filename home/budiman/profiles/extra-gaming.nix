{ pkgs, ... }:
{
  config = {
    home.packages = with pkgs; [
      (retroarch.withCores (
        cores: with cores; [
          mesen
          fceumm
        ]
      ))
    ];
  };
}

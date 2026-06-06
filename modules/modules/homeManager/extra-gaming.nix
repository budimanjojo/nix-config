{
  flake.modules.homeManager.extra-gaming =
    { pkgs, ... }:
    {
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

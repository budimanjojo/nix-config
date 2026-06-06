{
  flake.modules.homeManager.extra-utilities =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        gparted
        eog
        totem
        rhythmbox
        jellyfin-media-player
      ];
    };
}

{
  homeHosts.budimanjojo-ubuntu = { };

  flake.modules.homeManager."budiman@budimanjojo-ubuntu" =
    { pkgs, inputs, ... }:
    {
      myHome = {
        programs = {
          chezmoi.enable = true;
          go.enable = true;
          qmk.enable = true;
        };
        multiplexer.tmux.enable = true;
        homelab.kubernetes.enable = true;
        shell = {
          lf.enable = true;
          fish.enable = true;
        };
        terminal-emulator = {
          contour.enable = true;
          alacritty.enable = true;
        };
      };

      home.packages = [ pkgs.hugo ];

      targets.genericLinux = {
        # this add nix installed desktop files to be shown in application menu
        enable = true;
        nixGL.packages = inputs.nixgl.packages;
      };
    };
}

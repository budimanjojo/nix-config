{
  flake.modules.homeManager.core =
    {
      config,
      lib,
      options,
      ...
    }:
    let
      cfg = config.myHome.shell.git;
    in
    {
      options.myHome.shell.git = {
        enable = lib.mkEnableOption "git";
        config = lib.mkOption {
          type = options.programs.git.extraConfig.type;
          default = options.programs.git.extraConfig.default;
        };
      };

      config = lib.mkIf (cfg.enable) {
        programs = {
          git = {
            enable = true;
            settings = cfg.config;
          };

          gh = {
            enable = true;
            settings = {
              # https://github.com/nix-community/home-manager/issues/4744
              version = 1;
            };
          };

          fish.shellAbbrs = {
            g = "git";
            ga = "git add .";
            gaa = "git add --all";
            gc = "git commit";
            gcm = "git commit -m";
            gs = "git status";
            gp = "git push";
            gpl = "git pull";
            gl = "git log";
            gd = "git diff";
            gds = "git diff --staged";
            gr = "git restore .";
            grs = "git restore --staged .";
          };
        };

      };
    };
}

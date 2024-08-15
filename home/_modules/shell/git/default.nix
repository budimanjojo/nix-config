{
  config,
  lib,
  options,
  ...
}:
let
  cfg = config.myHome.shell.git;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.myHome.shell.git = {
    enable = mkEnableOption "git";
    username = mkOption {
      type = types.str;
      default = "";
    };
    email = mkOption {
      type = types.str;
      default = "";
    };
    config = mkOption {
      type = options.programs.git.extraConfig.type;
      default = options.programs.git.extraConfig.default;
    };
  };

  config = mkIf (cfg.enable) {
    programs.git = {
      enable = true;
      userName = cfg.username;
      userEmail = cfg.email;
      extraConfig = cfg.config;
    };

    programs.gh = {
      enable = true;
      settings = {
        # https://github.com/nix-community/home-manager/issues/4744
        version = 1;
      };
    };

    programs.fish.shellAbbrs = {
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
}

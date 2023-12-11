{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.shell.git;
in {
  options.modules.shell.git = { enable = mkEnableOption "git"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.git = {
        enable = true;
        userName = "budimanjojo";
        userEmail = "budimanjojo@gmail.com";
        extraConfig = {
          commit = {
            template = "${./gitcommit-message}";
            gpgSign = true;
          };
          user = {
            signingKey = "/home/${config.deviceCfg.username}/.ssh/id_rsa.pub";
          };
          gpg = {
            format = "ssh";
          };
        };
      };

      programs.gh.enable = true;
    };
  };
}

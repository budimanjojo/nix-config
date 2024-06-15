{ lib, config, ... }:
with lib;
let
  cfg = config.hm-modules.shell.git;
in
{
  options.hm-modules.shell.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
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

    programs.gh = {
      enable = true;
      settings = {
        # https://github.com/nix-community/home-manager/issues/4744
        version = 1;
      };
    };
  };
}

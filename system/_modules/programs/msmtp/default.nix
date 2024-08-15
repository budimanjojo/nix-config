{
  config,
  lib,
  pkgs,
  ...
}:
let
  mySystem = config.mySystem;
  cfg = mySystem.programs.msmtp;
in
{
  options.mySystem.programs.msmtp = {
    enable = lib.mkEnableOption "msmtp";
  };

  config = lib.mkIf (cfg.enable) {
    sops.secrets.gmail-password = {
      sopsFile = ./secret.sops.yaml;
      owner = "${mySystem.adminUser}";
      group = "${config.users.users.${mySystem.adminUser}.group}";
    };

    programs.msmtp = {
      enable = true;
      accounts = {
        gmail = {
          auth = true;
          host = "smtp.gmail.com";
          port = 587;
          tls = true;
          tls_starttls = true;
          from = "budimanjojo@gmail.com";
          user = "budimanjojo";
          passwordeval = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.gmail-password.path}";
        };
      };
      extraConfig = ''
        account default: gmail
      '';
    };
  };
}

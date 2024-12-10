{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.mySystem.services.restic-backup;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.mySystem.services.restic-backup = {
    enable = mkEnableOption "restic-backup";
    location = mkOption {
      type = types.str;
      description = "restic repository location";
      default = "s3:http://192.168.15.15:9000/restic-repository";
    };
  };

  config = mkIf (cfg.enable) {
    # function to create attrset that can be consumed by `services.restic.backups` module
    # options needs to be an attrset that has `app`, `paths`, and optional `excludePaths` keys
    lib.mySystem.mkRestic = options: {
      "${options.app}" = {
        paths = options.paths;
        initialize = true;
        repository = "${cfg.location}/${options.app}";
        passwordFile = config.sops.secrets."restic/password".path;
        environmentFile = config.sops.secrets."restic/env".path;
        exclude = if builtins.hasAttr "excludePaths" options then options.excludePaths else [ ];
        timerConfig = {
          OnCalendar = "02:00";
          Persistent = true;
          RandomizedDelaySec = "3h";
        };
        pruneOpts = [
          "--keep-daily 10"
          "--keep-monthly 2"
        ];
        backupPrepareCommand = ''
          # remove stale locks - this avoids some occasional annoyance
          ${pkgs.restic}/bin/restic unlock --remove-all || true
        '';
      };
    };

    sops.secrets = {
      "restic/password".sopsFile = ./secret.sops.yaml;
      "restic/env".sopsFile = ./secret.sops.yaml;
    };
  };
}

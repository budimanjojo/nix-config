{
  config,
  options,
  pkgs,
  lib,
  utils,
  ...
}:
let
  cfg = config.mySystem.services.btrfs-autoscrub;
  parentOpt = options.services.btrfs.autoScrub;

  mail-started = pkgs.writeShellScript "mail.sh" ''
    DIRNAME=$1
    HOSTNAME=${config.networking.fqdnOrHostName}
    TO=budimanjojo@gmail.com

    /run/wrappers/bin/sendmail -i -- $TO << EOF
    From: btrfs on $HOSTNAME <budimanjojo@gmail.com>
    To: $TO
    Subject: BTRFS scrub status

    BTRFS scrub for "$DIRNAME" on "$HOSTNAME" started.
    EOF
  '';

  mail-stopped = pkgs.writeShellScript "mail.sh" ''
    DIRNAME=$1
    HOSTNAME=${config.networking.fqdnOrHostName}
    TO=budimanjojo@gmail.com

    /run/wrappers/bin/sendmail -i -- $TO << EOF
    From: btrfs on $HOSTNAME <budimanjojo@gmail.com>
    To: $TO
    Subject: BTRFS scrub status

    BTRFS scrub for "$DIRNAME" on "$HOSTNAME" unexpectedly stopped.
    EOF
  '';
in
{
  options.mySystem.services.btrfs-autoscrub = {
    enable = lib.mkEnableOption "btrfs auto scrub";
    interval = lib.mkOption {
      type = parentOpt.interval.type;
      default = parentOpt.interval.default;
    };
    fileSystems = lib.mkOption {
      type = parentOpt.fileSystems.type;
      default = parentOpt.fileSystems.default;
    };
  };

  config = lib.mkIf (cfg.enable) {
    mySystem.programs.msmtp.enable = true;

    services.btrfs.autoScrub = {
      enable = true;
      interval = cfg.interval;
      fileSystems = cfg.fileSystems;
    };

    systemd.services = builtins.listToAttrs (
      map (
        fs:
        (lib.nameValuePair "btrfs-scrub-${utils.escapeSystemdPath fs}" {
          postStart = "${mail-started} ${fs}";
          postStop = "(${pkgs.btrfs-progs}/bin/btrfs scrub status ${fs} | ${pkgs.gnugrep}/bin/grep finished) || ${mail-stopped} ${fs}";
        })
      ) cfg.fileSystems
    );
  };
}

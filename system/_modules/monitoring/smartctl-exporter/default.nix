{ config, lib, ... }:
let
  cfg = config.mySystem.monitoring.smartctl-exporter;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.mySystem.monitoring.smartctl-exporter = {
    enable = mkEnableOption "Prometheus smartctl exporter";
  };

  config = mkIf (cfg.enable) {
    services = {
      prometheus.exporters.smartctl = {
        enable = true;
        openFirewall = true;
      };

      # `/dev/nvme*` devices are not in `disk` group by default so `smartctl-exporter` won't work on them
      # workaround until https://github.com/NixOS/nixpkgs/pull/205165/commits/36256aeaa2fded21257127a9c1d17d6299ef9395 is merged
      udev.extraRules = ''
        SUBSYSTEM=="nvme", KERNEL=="nvme[0-9]*", GROUP="disk"
      '';
    };
  };
}

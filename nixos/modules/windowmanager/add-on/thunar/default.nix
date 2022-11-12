{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.thunar;
in {
  options.modules.windowmanager.add-on.thunar = { enable = mkEnableOption "thunar"; };

  config = mkIf cfg.enable {
    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };
    programs.file-roller.enable = true;
    services.tumbler.enable = true;
    services.gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };
    environment.systemPackages = with pkgs; [
      ffmpegthumbnailer
    ];
  };
}

{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.mySystem.windowmanager.add-on.thunar;
in
{
  options.mySystem.windowmanager.add-on.thunar = {
    enable = lib.mkEnableOption "Thunar file manager";
  };

  config = lib.mkIf (cfg.enable) {
    programs = {
      thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
          thunar-volman
          thunar-archive-plugin
          thunar-media-tags-plugin
        ];
      };
      file-roller.enable = true;
    };
    services = {
      tumbler.enable = true;
      gvfs = {
        enable = true;
        package = pkgs.gvfs;
      };
    };
    environment.systemPackages = [ pkgs.ffmpegthumbnailer ];
  };
}

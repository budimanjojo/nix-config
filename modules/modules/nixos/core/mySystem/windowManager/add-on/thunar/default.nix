{
  flake.modules.nixos.core =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.mySystem.windowManager.add-on.thunar;
    in
    {
      options.mySystem.windowManager.add-on.thunar = {
        enable = lib.mkEnableOption "Thunar file manager";
      };

      config = lib.mkIf (cfg.enable) {
        programs.thunar = {
          enable = true;
          plugins = with pkgs.xfce; [
            thunar-volman
            thunar-archive-plugin
            thunar-media-tags-plugin
          ];
        };

        services = {
          tumbler.enable = true;
          gvfs.enable = true;
        };

        environment.systemPackages = with pkgs; [
          ffmpegthumbnailer
          file-roller
        ];
      };
    };
}

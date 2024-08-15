{
  config,
  lib,
  pkgs,
  ...
}:
let
  myHome = config.myHome;
  cfg = myHome.windowmanager.add-on.rofi;
in
{
  options.myHome.windowmanager.add-on.rofi = {
    enable = lib.mkEnableOption "rofi";
  };

  config = lib.mkIf (cfg.enable) {
    programs.rofi = {
      enable = true;
      package = lib.mkIf (myHome.isWayland) pkgs.rofi-wayland;
      extraConfig = {
        font = "UbuntuMono Nerd Font 12";
        display-drun = " ";
        show-icons = true;
        drun-display-format = "{name}";
        disable-history = false;
        sidebar-mode = false;
      };
      theme = ./style.rasi;
    };
  };
}

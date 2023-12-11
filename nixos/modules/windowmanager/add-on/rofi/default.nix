{ pkgs, lib, config, ... }:
with lib;
let
  cfg = config.modules.windowmanager.add-on.rofi;
in {
  options.modules.windowmanager.add-on.rofi = {
    enable = mkEnableOption "rofi";
    package = mkOption {
      default = pkgs.rofi;
      type = types.package;
    };
  };

  config = mkIf cfg.enable {
    home.manager.programs.rofi = {
      enable = true;
      package = mkIf config.deviceCfg.isWayland pkgs.rofi-wayland;
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

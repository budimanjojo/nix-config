{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.terminal-emulator.wezterm;
in
{
  options.myHome.terminal-emulator.wezterm = {
    enable = lib.mkEnableOption "WezTerm";
  };

  config = lib.mkIf (cfg.enable) {
    programs.wezterm = {
      enable = true;
      package = (config.lib.nixGL.wrap pkgs.wezterm);
      extraConfig = builtins.readFile ./config/wezterm.lua;
    };
  };
}

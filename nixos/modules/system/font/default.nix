{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.system.font;
in {
  options.modules.system.font = { enable = mkEnableOption "font"; };

  config = mkIf cfg.enable {
    fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "UbuntuMono" ]; })
      unifont
    ];
  };
}

{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.hm-modules.editor.geany;
in {
  options.hm-modules.editor.geany = { enable = mkEnableOption "geany"; };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.geany ];
  };
}

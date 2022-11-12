{ pkgs, lib, config, ... }:
with lib;
let 
  cfg = config.modules.editor.geany;
in {
  options.modules.editor.geany = { enable = mkEnableOption "geany"; };

  config = mkIf cfg.enable {
    home.manager.home.packages = [ pkgs.geany ];
  };
}

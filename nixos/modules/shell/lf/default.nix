{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.shell.lf;
in {
  options.modules.shell.lf = { enable = mkEnableOption "lf"; };

  config = mkIf cfg.enable {
    home.manager = {
      programs.lf = {
        enable = true;
        extraConfig = ''
          set previewer ${pkgs.ctpv}/bin/ctpv
          set cleaner ${pkgs.ctpv}/bin/ctpvclear
          &${pkgs.ctpv}/bin/ctpv -s $id
          &${pkgs.ctpv}/bin/ctpvquit $id
        '';
      };

      home.packages = with pkgs; [
        chafa
        poppler_utils
        ffmpegthumbnailer
      ];
    };
  };
}

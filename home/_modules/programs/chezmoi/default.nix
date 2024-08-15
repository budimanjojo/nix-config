{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.programs.chezmoi;
  inherit (lib)
    mkEnableOption
    mkOption
    types
    mkIf
    ;
in
{
  options.myHome.programs.chezmoi = {
    enable = mkEnableOption "chezmoi";
    sourcePath = mkOption {
      type = types.path;
      default = "${config.home.homeDirectory}/Github/dotfiles";
    };
  };

  config = mkIf (cfg.enable) {
    home.activation.chezmoi = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      CHEZMOI_SRCDIR=${cfg.sourcePath}

      if [[ ! -d $CHEZMOI_SRCDIR ]]; then
        _iError 'Error: path "%s" does not exists' "$CHEZMOI_SRCDIR"
        exit 1
      fi

      run ${pkgs.chezmoi}/bin/chezmoi apply -S ${cfg.sourcePath} --verbose
    '';
  };
}

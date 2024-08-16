{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myHome.programs.chezmoi;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.myHome.programs.chezmoi = {
    enable = mkEnableOption "chezmoi";
  };

  config = mkIf (cfg.enable) {
    home.activation.chezmoi = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      # I want chezmoi to have access to the userspace $PATH
      PATH="${config.home.path}/bin:$PATH"

      run ${pkgs.chezmoi}/bin/chezmoi apply -S ${../../../../chezmoi} $VERBOSE_ARG
    '';
  };
}

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
    # we want to do stuffs after HM has finished linking stuffs in `$NIX_PROFILES/bin`
    home.activation.chezmoi = lib.hm.dag.entryAfter [ "installPackages" ] ''
      # I want chezmoi to have access to the userspace $PATH
      _saved_path=$PATH
      PATH="${config.home.path}/bin:$PATH"
      # a lot of my chezmoi scripts needs system programs to work, might be a bad idea idk
      PATH=$PATH:/usr/local/bin:/usr/bin:/bin

      run ${pkgs.chezmoi}/bin/chezmoi apply -S ${../../../..} $VERBOSE_ARG

      # return it back
      PATH=$_saved_path
    '';
  };
}

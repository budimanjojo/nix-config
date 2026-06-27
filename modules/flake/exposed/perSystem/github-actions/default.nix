{ inputs, ... }: {
  imports = [ inputs.github-actions-nix.flakeModules.default ];

  perSystem = { pkgs, config, ... }: {
    # GitHub workflows files are managed in Nix
    githubActions.enable = true;

    # nix build .#workflows
    # cp -r result/.github/workflows .github/
    packages.workflows = pkgs.runCommand "copy-workflows" { } ''
      mkdir -p $out/.github/workflows
      cp -r ${config.githubActions.workflowsDir}/* $out/.github/workflows/
    '';
  };
}

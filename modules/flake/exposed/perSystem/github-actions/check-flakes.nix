{ config, ... }:
let
  deps = config.actionsDependencies;
in
{
  perSystem = {
    githubActions.workflows.check-flakes = {
      name = "Check Flakes";

      on = {
        pullRequestTarget.types = [
          "opened"
          "auto_merge_enabled"
        ];
        push.paths = [
          "**.nix"
          "flake.lock"
        ];
      };

      jobs.check-flakes = {
        name = "\${{ matrix.system }}";
        runsOn = "\${{ matrix.runner }}";
        strategy = {
          failFast = false;
          matrix = config.perSystemMatrix;
        };
        steps = [
          { uses = deps.actionsCheckout; }
          { uses = deps.installNixAction; }
          { run = "nix flake check --print-build-logs --no-update-lock-file"; }
        ];
      };
    };
  };
}

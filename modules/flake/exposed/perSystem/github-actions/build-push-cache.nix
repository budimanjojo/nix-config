{ config, ... }:
let
  deps = config.actionsDependencies;
in
{
  perSystem = {
    githubActions.workflows.build-push-cache = {
      name = "Build Push Cache";

      on = {
        workflowDispatch = { };
        push.paths = [
          "modules/**"
          "packages/**"
          "overlays/**"
          "flake.lock"
          "flake.nix"
        ];
      };

      jobs.build-push = {
        name = "\${{ matrix.attrset }}";
        runsOn = "\${{ matrix.runner }}";
        strategy = {
          failFast = false;
          matrix = config.perHostMatrix;
        };
        steps = [
          { uses = deps.actionsCheckout; }
          {
            name = "Brutally add more storage to our runner";
            uses = deps.nothingButNix;
            with_ = {
              hatchet-protocol = "carve";
            };
          }
          {
            uses = deps.actionsCache;
            id = "cache";
            with_ = {
              path = "/tmp/nix-cache";
              key = "nix-flake-inputs-\${{ hashFiles('**/flake.lock') }}-\${{ matrix.system }}";
              restore-keys = "nix-flake-inputs-";
            };
          }
          { uses = deps.installNixAction; }
          {
            name = "Import Nix store cache";
            if_ = "steps.cache.outputs.cache-hit == 'true'";
            run = "nix copy --all --no-check-sigs --from /tmp/nix-cache";
          }
          {
            name = "Build and Export .#gc-keep to Nix store cache";
            run = ''
              # remove everything before copying so the cache doesn't grow over time
              sudo rm -rf /tmp/nix-cache
              nix copy --no-check-sigs --to /tmp/nix-cache .#gc-keep
            '';
          }
          {
            name = "Login to Cachix";
            uses = deps.cachixActions;
            with_ = {
              name = "budimanjojo";
              authToken = "\${{ secrets.CACHIX_AUTH_TOKEN }}";
              skipPush = true;
            };
          }
          {
            name = "Build and push to Cachix";
            run = ''
              nix develop --command \
                just ci-build ''${{ matrix.attrset }}
            '';
          }
        ];
      };
    };
  };
}

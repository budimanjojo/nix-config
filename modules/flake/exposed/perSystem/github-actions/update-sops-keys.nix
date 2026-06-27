{ config, ... }:
let
  deps = config.actionsDependencies;
in
{
  perSystem = {
    githubActions.workflows.update-sops-keys = {
      name = "Update SOPS Keys";
      on = {
        workflowDispatch = { };
        schedule = [ { cron = "0 * * * *"; } ];
        push.paths = [ ".sops.yaml" ];
      };
      jobs.update-sops-keys = {
        runsOn = "ubuntu-latest";
        steps = [
          { uses = deps.actionsCheckout; }
          { uses = deps.installNixAction; }
          { run = "nix develop"; }
          {
            run = "just update-sops-keys";
            env.SOPS_AGE_KEYS = "\${{ secrets.SOPS_AGE_KEY }}";
          }
          {
            name = "Generate Token";
            uses = deps.createAppToken;
            id = "generate-token";
            with_ = {
              client-id = "\${{ secrets.BOT_APP_ID }}";
              private-key = "\${{ secrets.BOT_APP_PRIVATE_KEY }}";
            };
          }
          {
            name = "Create Pull Request";
            id = "cpr";
            uses = deps.createPR;
            with_ = {
              token = "\${{ steps.generate-token.outputs.token }}";
              title = "chore(sops): update sops secrets with new public keys";
              commit-message = "chore(sops): update sops secrets with new public keys";
              delete-branch = true;
              committer = "budimanjojo-bot <111944664+budimanjojo-bot[bot]@users.noreply.github.com>";
              author = "budimanjojo-bot <111944664+budimanjojo-bot[bot]@users.noreply.github.com>";
            };
          }
          {
            name = "Automerge";
            env.GH_TOKEN = "\${{ steps.generate-token.outputs.token }}";
            if_ = "steps.cpr.outputs.pull-request-operation == 'created'";
            run = "gh pr merge --squash --auto \${{ steps.cpr.outputs.pull-request-number }}";
          }
        ];
      };
    };
  };
}

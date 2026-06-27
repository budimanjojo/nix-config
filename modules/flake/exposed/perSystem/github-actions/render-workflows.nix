{ config, ... }:
let
  deps = config.actionsDependencies;
in
{
  perSystem = {
    githubActions.workflows.render-workflows = {
      name = "Render Workflows";

      on = {
        workflowDispatch = { };
        schedule = [ { cron = "0 * * * *"; } ];
        push.paths = [ "**/github-actions/**.nix" ];
      };

      jobs.render-workflows = {
        runsOn = "ubuntu-latest";
        steps = [
          { uses = deps.actionsCheckout; }
          { uses = deps.installNixAction; }
          {
            run = ''
              nix develop --command \
                just render-workflows
            '';
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
              title = "chore(CI): update GitHub workflows files";
              commit-message = "chore(CI): update GitHub workflows files";
              delete-branch = true;
              labels = "nvfetcher";
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

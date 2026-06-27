{ config, ... }:
let
  deps = config.actionsDependencies;
in
{
  perSystem = {
    githubActions.workflows.update-nvfetcher = {
      name = "Update nvfetcher";

      on = {
        workflowDispatch = { };
        schedule = [ { cron = "0 * * * *"; } ];
        push.paths = [ "packages/nvfetcher.toml" ];
      };

      jobs.update-nvfetcher = {
        runsOn = "ubuntu-latest";
        steps = [
          { uses = deps.actionsCheckout; }
          { uses = deps.installNixAction; }
          { run = "nix profile install github:berberman/nvfetcher"; }
          {
            id = "update_nvfetcher";
            run = ''
              cd packages
              echo "OUTPUT<<EOF" >> $GITHUB_OUTPUT
              nvfetcher | sed -n '/Changes/,/$!d/p' >> $GITHUB_OUTPUT
              echo "EOF" >> $GITHUB_OUTPUT
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
              title = "chore(deps): update packages managed by nvfetcher";
              commit-message = "chore(deps): update packages managed by nvfetcher";
              delete-branch = true;
              labels = "nvfetcher";
              committer = "budimanjojo-bot <111944664+budimanjojo-bot[bot]@users.noreply.github.com>";
              author = "budimanjojo-bot <111944664+budimanjojo-bot[bot]@users.noreply.github.com>";
              body = ''
                ''${{ steps.update_nvfetcher.outputs.OUTPUT }}
              '';
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

{ config, ... }:
let
  deps = config.actionsDependencies;
in
{
  perSystem = {
    githubActions.workflows.renovate = {
      name = "Renovate";
      on = {
        push.paths = [ ".github/renovate.json" ];
        schedule = [ { cron = "0 * * * *"; } ];
        workflowDispatch.inputs = {
          dryRun = {
            description = "Dry Run";
            type = "boolean";
            default = false;
            required = true;
          };
          logLevel = {
            description = "Log Level";
            type = "choice";
            default = "debug";
            options = [
              "debug"
              "info"
            ];
            required = true;
          };
        };
      };

      concurrency = {
        group = "\${{ github.workflow }}-\${{ github.event.number || github.ref }}";
        cancelInProgress = true;
      };

      permissions.contents = "read";

      jobs.main = {
        name = "Renovate";
        runsOn = "ubuntu-latest";
        permissions.packages = "read";
        steps = [
          {
            name = "Generate Token";
            uses = deps.createAppToken;
            id = "app-token";
            with_ = {
              client-id = "\${{ secrets.BOT_APP_ID }}";
              private-key = "\${{ secrets.BOT_APP_PRIVATE_KEY }}";
              permission-checks = "write";
              permission-contents = "write";
              permission-issues = "write";
              permission-pull-requests = "write";
              permission-statuses = "write";
              permission-vulnerability-alerts = "read";
              permission-workflows = "write";
            };
          }
          { uses = deps.actionsCheckout; }
          {
            name = "Run Renovate";
            uses = deps.renovatebotGithubAction;
            env = {
              LOG_LEVEL = "\${{ inputs.logLevel || 'debug' }}";
              RENOVATE_AUTODISCOVER = "true";
              RENOVATE_AUTODISCOVER_FILTER = "\${{ github.repository }}";
              RENOVATE_DRY_RUN = "\${{ inputs.dryRun }}";
              RENOVATE_INTERNAL_CHECKS_FILTER = "strict";
              RENOVATE_PLATFORM = "github";
              RENOVATE_PLATFORM_COMMIT = "true";
            };
            with_.token = "\${{ steps.app-token.outputs.token }}";
          }
        ];
      };
    };
  };
}

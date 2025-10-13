{ pkgs, ... }:
{
  config = {
    plugins = {
      # make lua_ls works with neovim API
      lazydev = {
        enable = true;
        settings.library = [
          {
            path = "\${3rd}/luv/library";
            words = [ "vim%.uv" ];
          }
        ];
      };

      lspconfig.enable = true; # this provides sane defaults for LSP servers
      schemastore.enable = true;
      lsp-signature.enable = true;
      trouble.enable = true;
      web-devicons.enable = true;
    };

    lsp = {
      keymaps = [
        {
          key = "<Leader>rn";
          lspBufAction = "rename";
          mode = [ "n" ];
          options.desc = "Do LSP rename action";
        }
        {
          key = "<Leader>ca";
          lspBufAction = "code_action";
          mode = [ "n" ];
          options.desc = "Do LSP code action";
        }
        {
          key = "gd";
          lspBufAction = "definition";
          mode = [ "n" ];
          options.desc = "Do LSP get definition action";
        }
        {
          key = "gD";
          lspBufAction = "declaration";
          mode = [ "n" ];
          options.desc = "Do LSP get declaration action";
        }
        {
          key = "gh";
          action.__raw = ''
            function()
              return require('utils').fix_buf_hover()
            end
          '';
          mode = [ "n" ];
          options.desc = "Do LSP hover action";
        }
        {
          key = "gr";
          lspBufAction = "references";
          mode = [ "n" ];
          options.desc = "Do LSP get references action";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
          mode = [ "n" ];
          options.desc = "Do LSP get implementation action";
        }
      ];

      servers = {
        # ansiblels.enable = true;
        bashls.enable = true;
        cssls.enable = true;
        dockerls.enable = true;

        gopls = {
          enable = true;
          package = pkgs.unstable.gopls;
          settings.settings.gopls.gofumpt = true;
        };

        jsonls = {
          enable = true;
          settings.filetypes = [
            "json"
            "jsonc"
            "json5"
          ];
        };

        nil_ls.enable = true;
        pyright.enable = true;
        lua_ls.enable = true;
        taplo.enable = true;
        ts_ls.enable = true;

        yamlls = {
          enable = true;
          settings.settings.yaml = {
            customTags = [
              "!include_dir_list"
              "!include_dir_named"
              "!include_dir_merge_list"
              "!include_dir_merge_named"
              "!secret"
              "!env_var"
            ];
            schemas = {
              kubernetes = [
                "namespace.yaml"
                "deployment.yaml"
                "daemonset.yaml"
                "statefulset.yaml"
                "service.yaml"
                "pv.yaml"
                "pvc.yaml"
                "configmmap.yaml"
                "secret.yaml"
                "rbac.yaml"
                "crd.yaml"
                "storageclass.yaml"
                "cronjob.yaml"
              ];
              "https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json" = [
                "docker-compose.yml"
                "docker-compose.yaml"
              ];
              "https://json.schemastore.org/github-workflow" = [
                ".github/workflows/**.yml"
                ".github/workflows/**.yaml"
              ];
              "https://json.schemastore.org/github-actions" = [
                "action.yml"
                "action.yaml"
              ];
              "https://json.schemastore.org/gitlab-ci" = ".gitlab-ci.yml";
              "https://json.schemastore.org/kustomization" = [
                "kustomization.yml"
                "kustomization.yaml"
              ];
              "https://json.schemastore.org/pre-commit-config" = [
                ".pre-commit-config.yml"
                ".pre-commit-config.yaml"
              ];
            };
          };
        };
      };
    };
  };
}

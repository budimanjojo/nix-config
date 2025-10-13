{ pkgs, ... }:
{
  config.plugins.none-ls = {
    enable = true;
    settings.diagnostics_format = "[#{c}] #{m} (#{s})";
    sources = {
      formatting = {
        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        shfmt = {
          enable = true;
          settings.extra_args = [
            "-i"
            "2"
            "-ci"
          ];
        };
      };
      diagnostics = {
        ansiblelint = {
          enable = true;
          settings.filetypes = [ "yaml.ansible" ];
        };
        golangci_lint = {
          enable = true;
          package = pkgs.unstable.golangci-lint;
        };
        markdownlint.enable = true;
        write_good.enable = true;
        yamllint.enable = true;
      };
    };
  };
}

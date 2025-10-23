{ pkgs, ... }:
{
  config.plugins = {
    blink-cmp = {
      enable = true;
      package = pkgs.unstable.vimPlugins.blink-cmp;
      settings = {
        appearance.nerd_font_variant = "normal"; # UbuntuMono Nerd Font is not a mono font?
        snippets.preset = "luasnip";
        sources = {
          providers = {
            path = {
              score_offset = 40;
              opts.trailing_slash = false;
            };
            lsp.score_offset = 30;
            snippets = {
              score_offset = 20;
              opts.use_label_description = true;
            };
            buffer.score_offset = 10;
          };
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };

        keymap = {
          preset = "none";
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<Up>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<Down>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<C-y>" = [
            "select_and_accept"
            "fallback"
          ];
        };

        completion = {
          keyword.range = "full";
          list.selection.preselect = false;
          menu.draw.columns = [
            { __raw = "{'label', 'label_description', gap = 1}"; }
            { __raw = "{'kind_icon', 'kind'}"; }
            { __raw = "{'source_name'}"; }
          ];
          documentation.auto_show = true;
          ghost_text = {
            enabled = true;
            show_without_selection = true;
          };
        };

        fuzzy.sorts = [
          "exact"
          "score"
          "sort_text"
        ];

        cmdline = {
          keymap = {
            preset = "none";
            "<Tab>" = [
              "show_and_insert_or_accept_single"
              "select_next"
            ];
            "<S-Tab>" = [
              "show_and_insert_or_accept_single"
              "select_prev"
            ];
            "<C-j>" = [
              "select_next"
              "fallback"
            ];
            "<C-k>" = [
              "select_prev"
              "fallback"
            ];
            "<CR>" = [
              "accept"
              "fallback"
            ];
            "<C-y>" = [
              "select_accept_and_enter"
              "fallback"
            ];
          };
          completion = {
            menu.auto_show = false;
          };
        };
      };
    };
  };
}

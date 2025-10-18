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
            path.score_offset = 40;
            lsp.score_offset = 30;
            snippets.score_offset = 20;
            buffer.score_offset = 10;
            snippets.opts.use_label_description = true;
          };
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
        keymap = {
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-Space>" = [
            "select_and_accept"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
        };
        completion = {
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
          keymap.preset = "inherit";
          completion.menu.auto_show = true;
        };
      };
    };
  };
}

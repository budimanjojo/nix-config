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
            lsp.score_offset = 20;
            snippets.score_offset = 10;
            buffer.score_offset = 10;
            spell = {
              module = "blink-cmp-spell";
              name = "Spell";
              min_keyword_length = 3;
              score_offset = -10;
            };
            snippets.opts.use_label_description = true;
          };
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "spell"
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
          trigger = {
            show_on_backspace = true;
            show_on_backspace_in_keyword = true;
          };
          ghost_text.enabled = true;
        };
        fuzzy.sorts = [
          # "exact" # TODO: waiting for https://github.com/nix-community/nixvim/pull/3622
          "score"
          "sort_text"
        ];
        cmdline = {
          keymap.preset = "inherit";
          completion.menu.auto_show = true;
        };
      };
    };

    blink-cmp-spell.enable = true;
  };
}

{
  config = {
    colorschemes.catppuccin.settings.integrations = {
      noice = true;
      notify = true;
    };

    plugins = {
      # dependencies
      notify.enable = true;
      nui.enable = true;

      noice = {
        enable = true;
        settings = {
          lsp = {
            signature.enabled = false;
            # override markdown rendering to use treesitter
            override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
            };
          };

          messages.view_history = "popup";
          popupmenu.enabled = false;

          routes = [
            # hide search virtual text
            {
              filter = {
                event = "msg_show";
                kind = "search_count";
              };
              opts.skip = true;
            }

            # hide `vim.tbl_islist` is deprecated message
            {
              filter = {
                event = "msg_show";
                find = "vim.tbl_islist is deprecated";
              };
              opts.skip = true;
            }

            # route any messages with more than 10 lines to popup view
            {
              filter = {
                event = "msg_show";
                min_height = 10;
              };
              view = "popup";
            }
          ];
        };
      };
    };
  };
}

{
  config = {
    plugins.oil = {
      enable = true;
      settings = {
        columns = [
          "icon"
          "size"
        ];
        use_default_keymaps = false;

        keymaps = {
          "?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<C-h>" = "actions.parent";
          "<C-l>" = "actions.select";
          "`" = "actions.open_cwd";
          "<C-s>" = "actions.select_split";
          "<C-v>" = "actions.select_vsplit";
          "q" = "actions.close";
          "<C-r>" = "actions.refresh";
          "." = "actions.toggle_hidden";
        };

        float = {
          max_width = 50;
          max_height = 40;
          border = "rounded";
          win_options.winblend = 10;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-f>";
        action.__raw = "function()
          return require('oil').toggle_float()
        end";
        options.desc = "Toggle floating file explorer";
      }
    ];
  };
}

{ pkgs, ... }:
{
  plugins.snacks.settings.picker = {
    layout = "telescope";

    layouts.telescope = {
      reverse = false;
      cycle = true;
    };

    # TODO: very long title is being truncated with defaults
    layouts.select.layout.min_width = 120;

    sources.files.hidden = true;

    win.input.keys = {
      "<Esc>" = {
        __unkeyed-1 = "close";
        mode = [
          "i"
          "n"
        ];
      };
      "<C-h>" = {
        __unkeyed-1 = "toggle_hidden";
        mode = [
          "i"
          "n"
        ];
      };
    };
  };

  extraPackages = with pkgs; [
    ripgrep
    fd
    git
  ];

  keymaps = [
    {
      mode = "n";
      key = "<Leader>fz";
      action.__raw = "function() Snacks.picker() end";
      options.desc = "Find everything";
    }
    {
      mode = "n";
      key = "<Leader>ff";
      action.__raw = "function() Snacks.picker.files() end";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<Leader>fg";
      action.__raw = "function() Snacks.picker.grep() end";
      options.desc = "Grep from project";
    }
    {
      mode = "n";
      key = "<Leader>fc";
      action.__raw = "function() Snacks.picker.git_log() end";
      options.desc = "Git commits log";
    }
    {
      mode = "n";
      key = "<Leader>fb";
      action.__raw = "function() Snacks.picker.buffers() end";
      options.desc = "Find from buffers";
    }
    {
      mode = "n";
      key = "<Leader>fh";
      action.__raw = "function() Snacks.picker.help() end";
      options.desc = "Find help pages";
    }
    {
      mode = "n";
      key = "<Leader>fk";
      action.__raw = "function() Snacks.picker.keymaps() end";
      options.desc = "Find keymaps";
    }
    {
      mode = "n";
      key = "<Leader>fe";
      action.__raw = "function() Snacks.picker.diagnostics_buffer() end";
      options.desc = "Find buffer diagnostics";
    }
  ];
}

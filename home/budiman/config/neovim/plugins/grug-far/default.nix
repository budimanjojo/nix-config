{
  config = {
    plugins.grug-far = {
      enable = true;
      settings.keymaps = {
        replace.n = "<localleader>W";
        syncLocations.n = "<localleader>w";
        syncLine.n = "<localleader><space>";
        applyNext.n = "<localleader>j";
        applyPrev.n = "<localleader>k";
        openLocation.n = "<enter>";
        previewLocation.n = "<localleader>i";
        refresh.n = "<localleader>f";
        close.n = "q";
        help.n = "g?";
        abort.n = "<localleader>qq";
        qflist = false;
        historyOpen = false;
        historyAdd = false;
        openNextLocation = false;
        openPrevLocation = false;
        pickHistoryEntry = false;
        toggleShowCommand = false;
        swapEngine = false;
        swapReplacementInterpreter = false;
        syncNext = false;
        syncPrev = false;
        syncFile = false;
        nextInput = false;
        prevInput = false;
      };
    };

    keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<Leader>sr";
        action.__raw = ''
          function()
            return require('grug-far').open({
              prefills = { search = vim.api.nvim_get_current_line() };
            })
          end
        '';
        options.desc = "Open grug-far search and replace window with current line under cursor prefilled";
      }
    ];
  };
}

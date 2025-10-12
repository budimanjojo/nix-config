{ lib, ... }:
{
  config = {
    diagnostic.settings = {
      virtual_text = false;
      update_in_insert = true;
      float.source = "if_many";
      signs =
        let
          signs = {
            Error = "󰅚 ";
            Warn = "󰗖 ";
            Hint = "󰌶 ";
            Info = " ";
          };

          mkDiagnosticWithValue =
            valueFn:
            lib.nixvim.toRawKeys (
              lib.mapAttrs' (
                n: v: lib.nameValuePair "vim.diagnostic.severity.${lib.toUpper n}" (valueFn n v)
              ) signs
            );
        in
        {
          # { "__rawKey__vim.diagnostic.severity.ERROR" = "󰅚 "; ... }
          text = mkDiagnosticWithValue (_: v: v);
          # { "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticSignError"; ... }
          texthl = mkDiagnosticWithValue (n: _: "DiagnosticSign${n}");
          numhl = mkDiagnosticWithValue (n: _: "DiagnosticSign${n}");
        };
    };

    # set updatetime to 150ms
    opts.updatetime = 150;
    autoCmd = [
      {
        desc = "Show diagnostics on hover";
        event = "CursorHold";
        pattern = "*";
        callback = {
          __raw = "function()
            vim.diagnostic.open_float(nil, { focusable = false })
          end";
        };
      }
    ];
  };
}

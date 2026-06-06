{ ... }:
{
  flake.modules.generic.assertions =
    { hardware, ... }:
    {
      config.assertions = [
        (
          let
            monitors = hardware.monitors;
            primary = builtins.filter (m: m.primary) monitors;
          in
          {
            assertion = monitors == [ ] || builtins.length primary == 1;
            message =
              "Must have exactly one primery monitor in `hardware` module argument but found "
              + toString (builtins.length primary);
          }
        )

        (
          let
            allWorkspaces = builtins.concatMap (m: m.workspaces) hardware.monitors;
            duplicates = builtins.foldl' (
              acc: x:
              let
                count = builtins.length (builtins.filter (y: y == x) allWorkspaces);
              in
              if count > 1 && !(builtins.elem x acc) then acc ++ [ x ] else acc
            ) [ ] allWorkspaces;
          in
          {
            assertion = hardware.monitors == [ ] || duplicates == [ ];
            message =
              "Workspaces on all monitors should not overlap each other, overlapping workspace(s) found: ["
              + toString duplicates
              + "]";

          }

        )
      ];
    };
}

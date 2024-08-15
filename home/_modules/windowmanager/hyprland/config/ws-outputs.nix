{ config }:
let
  strBool = b: if b then "true" else "false";
  mkWorkspaces =
    monitors:
    builtins.concatMap (
      mon:
      builtins.map (
        ws: "${toString ws}, monitor:${mon.name}, default:${strBool (ws == builtins.head mon.workspaces)}"
      ) mon.workspaces
    ) monitors;
in
{
  # [ "<ws>, monitor:<name>, default:<bool>" "..." ]
  workspace = mkWorkspaces config.myHardware.monitors;
}

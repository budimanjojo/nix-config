{
  config,
  pkgs,
  lib,
}:
let
  myHardware = config.myHardware;
  modes = {
    resize = "Resize: (h/Left) width-, (j/Down) height-, (k/Up) height+, (l/Right) width+";
    gaps = "Gaps (o) outer, (i) inner";
    gapsOuter = "Outer Gaps (k/Up) grow locally, (K/Shift+Up) grow globally";
    gapsInner = "Inner Gaps (k/Up) grow locally, (K/Shift+Up) grow globally";
    system = "System (l) lock, (e) logout, (r) reboot, (s) shutdown, (f) UEFI";
  };
in
{
  floating.modifier = "Mod4";
  focus = {
    wrapping = "yes";
    followMouse = true;
    newWindow = "urgent";
  };
  gaps = {
    inner = 10;
    outer = 5;
    smartGaps = true;
  };

  # [ { output = "<xname>"; workspace = "<ws>"; } {...} ]
  workspaceOutputAssign = builtins.concatMap (
    mon:
    builtins.map (ws: {
      workspace = (toString ws);
      output = mon.xname;
    }) mon.workspaces
  ) myHardware.monitors;

  keybindings = import ./keybindings.nix { inherit config pkgs modes; };
  modes = import ./modes.nix { inherit modes pkgs; };
  window.commands = import ./commands.nix;
  startup = import ./startups.nix { inherit config pkgs lib; };
}

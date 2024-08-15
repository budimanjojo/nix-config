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
  };
in
{
  floating = {
    modifier = "Mod4";
    titlebar = false;
    border = 0;
  };
  window.border = 1;
  fonts = {
    names = [ "pango:UbuntuMono Nerd Font" ];
    size = 12.0;
  };
  focus = {
    wrapping = "yes";
    followMouse = true;
    newWindow = "smart";
  };
  gaps.inner = 10;
  bars = [ ];

  # { <name> = { bg = "<path> fill"; pos = "<x> <y>"; }; ... = {...}; }
  output = builtins.listToAttrs (
    builtins.map (m: {
      name = m.name;
      value = {
        bg = "${m.wallpaper} fill";
        pos = "${toString m.x} ${toString m.y}";
      };
    }) (builtins.filter (m: m.wallpaper != null) myHardware.monitors)
  );

  # [ { output = "<xname>"; workspace = "<ws>"; } {...} ]
  workspaceOutputAssign = builtins.concatMap (
    mon:
    builtins.map (ws: {
      workspace = (toString ws);
      output = mon.name;
    }) mon.workspaces
  ) myHardware.monitors;

  keybindings = import ./keybindings.nix { inherit config modes pkgs; };
  modes = import ./modes.nix { inherit modes pkgs; };
  window.commands = import ./commands.nix;
  startup = import ./startups.nix { inherit pkgs; };
}

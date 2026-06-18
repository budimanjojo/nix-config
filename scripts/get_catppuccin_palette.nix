let
  data = builtins.fromJSON (
    builtins.readFile (
      builtins.fetchurl "https://raw.githubusercontent.com/catppuccin/palette/refs/heads/main/palette.json"
    )
  );

  flavors = [
    "latte"
    "frappe"
    "macchiato"
    "mocha"
  ];

  sanitizedList = builtins.map (flavor: {
    name = flavor;
    value = builtins.mapAttrs (_: v: v.hex) data.${flavor}.colors;
  }) flavors;
in
builtins.listToAttrs sanitizedList

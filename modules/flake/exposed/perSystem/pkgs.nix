{ inputs, self, ... }:
{
  perSystem =
    { system, self', ... }:
    {
      # override pkgs used by everything to have my overlays
      _module.args.pkgs =
        let
          config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
          };
        in
        import inputs.nixpkgs {
          inherit config system;
          overlays = builtins.attrValues (import "${self}/overlays" { inherit inputs config self'; });
        };
    };
}

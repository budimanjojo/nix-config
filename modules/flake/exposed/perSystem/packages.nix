{ self, inputs, ... }:
{
  perSystem =
    {
      pkgs,
      inputs',
      ...
    }:
    {
      # accessible via nix build .#<name>
      packages = import "${self}/packages" {
        inherit
          self
          inputs
          pkgs
          inputs'
          ;
      };
    };
}

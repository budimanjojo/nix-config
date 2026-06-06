{ self, ... }:
{
  flake.modules.nixos.core.imports = [
    # shared assertions for any host
    self.modules.generic.assertions
  ];
}

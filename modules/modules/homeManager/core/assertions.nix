{ self, ... }:
{
  flake.modules.homeManager.core.imports = [
    # shared assertions for any host
    self.modules.generic.assertions
  ];
}

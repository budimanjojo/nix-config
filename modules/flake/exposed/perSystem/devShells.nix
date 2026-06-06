{
  perSystem =
    { pkgs, ... }:
    {
      # accessible via `nix develop` to enter development shell
      devShells.default = pkgs.mkShell { buildInputs = [ pkgs.just ]; };
    };
}

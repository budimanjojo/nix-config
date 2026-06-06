{
  perSystem =
    { pkgs, ... }:
    {
      # accessible via `nix fmt` to format Nix code
      # TODO: use treefmt to format everything instead
      formatter = pkgs.nixfmt;
    };
}

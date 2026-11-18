{ lib, ... }:
let
  inherit (lib) mkOption types;
in
{
  options.actionsDependencies = mkOption {
    type = types.attrsOf types.str;
    internal = true;
    readOnly = true;
  };

  config.actionsDependencies = {
    actionsCheckout = "actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1"; # v7.0.1
    nothingButNix = "wimpysworld/nothing-but-nix@b2574ec1cf1462bee0a34de0fb6ff11ad3c43cb2"; # v12
    actionsCache = "actions/cache@55cc8345863c7cc4c66a329aec7e433d2d1c52a9"; # v6.1.0
    installNixAction = "cachix/install-nix-action@8aa03977d8d733052d78f4e008a241fd1dbf36b3"; # v31.10.6"
    cachixActions = "cachix/cachix-action@38b082610b782e7e93e209c35fd730d399dee866"; # v17
    createAppToken = "actions/create-github-app-token@f418cff399f7aef4c2f0ad47e25ca7a6abbdd6fc"; # v3.4.0
    renovatebotGithubAction = "renovatebot/github-action@acdd6bda8b035c99ce59d5675816af2aa65a1774"; # v46.3.14
    createPR = "peter-evans/create-pull-request@3ffccacd46053766916f087ce41d627c0b8cf2d1"; # v8.1.3
  };
}

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
    createAppToken = "actions/create-github-app-token@64ab729a6294000f5aa4a4bc0b73d1f32bc45510"; # v3.3.0
    renovatebotGithubAction = "renovatebot/github-action@266fef21329c44765ad42f9dea1f01f5d2d91084"; # v46.3.13
    createPR = "peter-evans/create-pull-request@5f6978faf089d4d20b00c7766989d076bb2fc7f1"; # v8.1.1
  };
}

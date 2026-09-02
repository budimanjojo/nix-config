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
    nothingButNix = "wimpysworld/nothing-but-nix@687c797a730352432950c707ab493fcc951818d7"; # v10
    actionsCache = "actions/cache@55cc8345863c7cc4c66a329aec7e433d2d1c52a9"; # v6.1.0
    installNixAction = "cachix/install-nix-action@8aa03977d8d733052d78f4e008a241fd1dbf36b3"; # v31.10.6"
    cachixActions = "cachix/cachix-action@38b082610b782e7e93e209c35fd730d399dee866"; # v17
    createAppToken = "actions/create-github-app-token@bcd2ba49218906704ab6c1aa796996da409d3eb1"; # v3.2.0
    renovatebotGithubAction = "renovatebot/github-action@39b914146caeff8cd512e61c8992f1d5913af85c"; # v46.2.5
    createPR = "peter-evans/create-pull-request@5f6978faf089d4d20b00c7766989d076bb2fc7f1"; # v8.1.1
  };
}

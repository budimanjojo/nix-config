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
    actionsCheckout = "actions/checkout@9c091bb21b7c1c1d1991bb908d89e4e9dddfe3e0"; # v7.0.0
    nothingButNix = "wimpysworld/nothing-but-nix@687c797a730352432950c707ab493fcc951818d7"; # v10
    actionsCache = "actions/cache@55cc8345863c7cc4c66a329aec7e433d2d1c52a9"; # v6.1.0
    installNixAction = "cachix/install-nix-action@8aa03977d8d733052d78f4e008a241fd1dbf36b3"; # v31.10.6"
    cachixActions = "cachix/cachix-action@5f2d7c5294214f71b873db4b969586b980625e71"; # v17
    createAppToken = "actions/create-github-app-token@bcd2ba49218906704ab6c1aa796996da409d3eb1"; # v3.2.0
    renovatebotGithubAction = "renovatebot/github-action@3064367f740a1a91cca218698a63902689cce200"; # v46.1.20
    createPR = "peter-evans/create-pull-request@5f6978faf089d4d20b00c7766989d076bb2fc7f1"; # v8.1.1
  };
}

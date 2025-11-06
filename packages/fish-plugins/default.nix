{ callPackage, buildFishPlugin }:
let
  sourceData = callPackage ../_sources/generated.nix { };
in
{
  abbreviation-tips = buildFishPlugin { inherit (sourceData.abbreviation-tips) pname src version; };
  tmux-fish = buildFishPlugin {
    inherit (sourceData.tmux-fish) pname src;
    version = sourceData.tmux-fish.date;
  };
  fish-completion-sync = buildFishPlugin {
    inherit (sourceData.fish-completion-sync) pname src version;
  };
}

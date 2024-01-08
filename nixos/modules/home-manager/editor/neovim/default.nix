{ lib, config, inputs, system, myPkgs,... }:
with lib;
let 
  cfg = config.hm-modules.editor.neovim;
in {
  options.hm-modules.editor.neovim = { enable = mkEnableOption "neovim"; };

  config = mkIf cfg.enable {
    home.packages = [
      (inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
        extraSpecialArgs = {
          inherit myPkgs;
        };
        module = {
          imports = [ ./configs/default.nix ];
        };
      })
    ];

    programs.bash.shellAliases = { vimdiff = "nvim -d"; };
    programs.fish.shellAliases = { vimdiff = "nvim -d"; };
    programs.zsh.shellAliases = { vimdiff = "nvim -d"; };
  };
}

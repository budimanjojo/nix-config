{
  flake.modules.generic.nixvim =
    { pkgs, ... }:
    {
      extraPlugins = [ pkgs.thisflake.chezmoi-vim ];

      globals."chezmoi#use_tmp_buffer" = true;
    };
}

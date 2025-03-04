# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  abbreviation-tips = {
    pname = "abbreviation-tips";
    version = "v0.7.0";
    src = fetchFromGitHub {
      owner = "gazorby";
      repo = "fish-abbreviation-tips";
      rev = "v0.7.0";
      fetchSubmodules = false;
      sha256 = "sha256-F1t81VliD+v6WEWqj1c1ehFBXzqLyumx5vV46s/FZRU=";
    };
  };
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "abf37336437867cbd99ce2f8849b717415391cc3";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "abf37336437867cbd99ce2f8849b717415391cc3";
      fetchSubmodules = false;
      sha256 = "sha256-S1/myC1dEydi1F9a6XV0lJW3S/wWQe+A2ZXPo8GbtQo=";
    };
    date = "2024-07-26";
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "d783191eaa75215beae0c80319fcce5e6b3beeda";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "d783191eaa75215beae0c80319fcce5e6b3beeda";
      fetchSubmodules = false;
      sha256 = "sha256-XpUsbj1boDfbyE8C6SdOvZdkd97682VVC81fvQ5WA/4=";
    };
    date = "2024-11-02";
  };
  k8s-snippets = {
    pname = "k8s-snippets";
    version = "ba5ca9b1b12a3b1c3fb0237494380f4feff668c8";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "ba5ca9b1b12a3b1c3fb0237494380f4feff668c8";
      fetchSubmodules = false;
      sha256 = "sha256-vVDKI9HR1QqJDHh10oZQ9Zr01gvJhj1iIEgwP+gssx8=";
    };
    date = "2023-12-13";
  };
  luasnip = {
    pname = "luasnip";
    version = "v2.3.0";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "v2.3.0";
      fetchSubmodules = false;
      sha256 = "sha256-E1Ov6aF9DJ0poVM6q6jK1ypsJf6cRzHqC2Gi6u9kai0=";
    };
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245";
      fetchSubmodules = false;
      sha256 = "sha256-+Rji3UH32QQZADqQhMcJpgmkwbDumKaBlZO6cqNvUGY=";
    };
    date = "2025-02-15";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "5639d58a3d11ff7c05c8e31e159bfedae55d7961";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "5639d58a3d11ff7c05c8e31e159bfedae55d7961";
      fetchSubmodules = false;
      sha256 = "sha256-KUX0bmh3x1w37dhfON6QMaXNBUTHgAwQD7XJyJhpLxE=";
    };
    date = "2025-02-25";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "d7c61c70849ec99f005615c4175118986f200e4f";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "d7c61c70849ec99f005615c4175118986f200e4f";
      fetchSubmodules = false;
      sha256 = "sha256-ghXyEoh+7QlR+bwdkceI0TLDBJ1OR+OHW1TUZbt65X0=";
    };
    date = "2025-03-04";
  };
  sad-nvim = {
    pname = "sad-nvim";
    version = "d5bb4e98b42ae0084ae6ec03aa285d1b2fa1ba8e";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "sad.nvim";
      rev = "d5bb4e98b42ae0084ae6ec03aa285d1b2fa1ba8e";
      fetchSubmodules = false;
      sha256 = "sha256-ldU9B6ABUy9GM/K+ysRtplj3sdFf0jjqv3L74oTMiF0=";
    };
    date = "2024-10-28";
  };
  tmux-fish = {
    pname = "tmux-fish";
    version = "d5e3ff87abc462aff8896d74f06e5f3dbcfed466";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "tmux.fish";
      rev = "d5e3ff87abc462aff8896d74f06e5f3dbcfed466";
      fetchSubmodules = false;
      sha256 = "sha256-11rzsR5WHKA/aKfksWk8nZXi6tx5d2RKZHoJGvb9k70=";
    };
    date = "2025-03-03";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "4dc45d60bf35f50ebd9ee41f16ab63783f80dd64";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "4dc45d60bf35f50ebd9ee41f16ab63783f80dd64";
      fetchSubmodules = false;
      sha256 = "sha256-AKZA+WCcfxDeNrNrq3XYw+SFoWd1VV2T9+CwK2y6+jA=";
    };
    date = "2024-11-06";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "4dc45d60bf35f50ebd9ee41f16ab63783f80dd64";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "4dc45d60bf35f50ebd9ee41f16ab63783f80dd64";
      fetchSubmodules = false;
      sha256 = "sha256-AKZA+WCcfxDeNrNrq3XYw+SFoWd1VV2T9+CwK2y6+jA=";
    };
    date = "2024-11-06";
  };
}

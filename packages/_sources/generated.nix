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
  about-time = {
    pname = "about-time";
    version = "4.2.1";
    src = fetchurl {
      url = "https://pypi.org/packages/source/a/about-time/about-time-4.2.1.tar.gz";
      sha256 = "sha256-alOIYtM85n2ZdCnRSZgxDh2/2my32bv795nEcJhH/s4=";
    };
  };
  alive-progress = {
    pname = "alive-progress";
    version = "3.2.0";
    src = fetchurl {
      url = "https://pypi.org/packages/source/a/alive-progress/alive-progress-3.2.0.tar.gz";
      sha256 = "sha256-7eKdBG/0VP5WuUH2hvid2TiUMMSlt2WORFywuA4OTes=";
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
  krr = {
    pname = "krr";
    version = "v1.60-alpha";
    src = fetchFromGitHub {
      owner = "robusta-dev";
      repo = "krr";
      rev = "v1.60-alpha";
      fetchSubmodules = false;
      sha256 = "sha256-rIKL1SHVO3kA8xMgKwkYsnRkYepEGmGXAPUkilYboHc=";
    };
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
    version = "97d9f1d3ad205dece6bcafd1d71cf1507608f3c7";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "97d9f1d3ad205dece6bcafd1d71cf1507608f3c7";
      fetchSubmodules = false;
      sha256 = "sha256-4bwn5MxBiCP6Yg/9BFBVu4wEIJvrDg6CidXEpWvF6eI=";
    };
    date = "2025-01-05";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "c5e07b8ff54187716334d585db34282e46fa2932";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "c5e07b8ff54187716334d585db34282e46fa2932";
      fetchSubmodules = false;
      sha256 = "sha256-HjBJkSZirQM9ZVEV0brdWx7zxAavgngXFIi8pcxO7v4=";
    };
    date = "2024-06-03";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "7c26a59ac0061b199bf9f44b19d45cfadd9b14f5";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "7c26a59ac0061b199bf9f44b19d45cfadd9b14f5";
      fetchSubmodules = false;
      sha256 = "sha256-hu56N+GjyLg5xyc8ROPJmb06J4MVzitrSh4KGOJ+jAE=";
    };
    date = "2025-01-12";
  };
  prometheus-api-client = {
    pname = "prometheus-api-client";
    version = "0.5.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/p/prometheus-api-client/prometheus-api-client-0.5.5.tar.gz";
      sha256 = "sha256-WUScS+BIXqWi37vtJILrCj7qyMExs+/IZt9MmgxAO7c=";
    };
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
    version = "0e0fc8052c7523a96d3c12313a51ba9921c59406";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "tmux.fish";
      rev = "0e0fc8052c7523a96d3c12313a51ba9921c59406";
      fetchSubmodules = false;
      sha256 = "sha256-HBu0SSFejZRSMIAK+5J8Ao8EPj4hpkIuWkI3gSJCn5c=";
    };
    date = "2024-10-21";
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

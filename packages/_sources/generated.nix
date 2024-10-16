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
    version = "3.1.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/a/alive-progress/alive-progress-3.1.5.tar.gz";
      sha256 = "sha256-QuOZpmyBUNxQdgLf97eVPxBe8R+vl92qbSexy/RcTJg=";
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
    version = "225db770e36aae6a1e9e3a65578095c8eb4038d3";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "225db770e36aae6a1e9e3a65578095c8eb4038d3";
      fetchSubmodules = false;
      sha256 = "sha256-V5rlORFlhgjAT0n+LcpMNdY+rEqQpur/KGTGH6uFxMY=";
    };
    date = "2024-06-05";
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
    version = "25c11854aa25558ee6c03432edfa0df0217324be";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "25c11854aa25558ee6c03432edfa0df0217324be";
      fetchSubmodules = false;
      sha256 = "sha256-VFGGj0ur8IsA/kKlknZy2J4eYF5sWX0IPDiWa5RZC3M=";
    };
    date = "2024-09-08";
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
    version = "39dbf875861449cf09e936fa80073f3413e9439c";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "39dbf875861449cf09e936fa80073f3413e9439c";
      fetchSubmodules = false;
      sha256 = "sha256-9paSpcW/rdIN5YpYgtoTN7UQITFNpKVbLnubXpxhJ8k=";
    };
    date = "2024-10-16";
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
    version = "869c7f3ca3dcd28fd78023db6a7e1bf8af0f4714";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "sad.nvim";
      rev = "869c7f3ca3dcd28fd78023db6a7e1bf8af0f4714";
      fetchSubmodules = false;
      sha256 = "sha256-uwXldYA7JdZHqoB4qfCnZcQW9YBjlRWmiz8mKb9jHuI=";
    };
    date = "2023-03-13";
  };
  tmux-fish = {
    pname = "tmux-fish";
    version = "7e820cb45c6784df71cbaf6dca0d17e39a9d59d4";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "tmux.fish";
      rev = "7e820cb45c6784df71cbaf6dca0d17e39a9d59d4";
      fetchSubmodules = false;
      sha256 = "sha256-ynhEhrdXQfE1dcYsSk2M2BFScNXWPh3aws0U7eDFtv4=";
    };
    date = "2024-10-14";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "0a03005a02b9eba130e158cd1169d542e3a5a99a";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "0a03005a02b9eba130e158cd1169d542e3a5a99a";
      fetchSubmodules = false;
      sha256 = "sha256-WRFFjYLwZM42zgGsGmVdUmaFrLlYibgBsFvhgG5VHNU=";
    };
    date = "2024-09-12";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "0a03005a02b9eba130e158cd1169d542e3a5a99a";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "0a03005a02b9eba130e158cd1169d542e3a5a99a";
      fetchSubmodules = false;
      sha256 = "sha256-WRFFjYLwZM42zgGsGmVdUmaFrLlYibgBsFvhgG5VHNU=";
    };
    date = "2024-09-12";
  };
}

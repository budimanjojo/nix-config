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
  autopair-fish = {
    pname = "autopair-fish";
    version = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
    src = fetchFromGitHub {
      owner = "jorgebucaran";
      repo = "autopair.fish";
      rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
      fetchSubmodules = false;
      sha256 = "sha256-qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
    };
    date = "2022-07-04";
  };
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "2c788074b4a2e04b2317b21ce07a405d7808a920";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "2c788074b4a2e04b2317b21ce07a405d7808a920";
      fetchSubmodules = false;
      sha256 = "sha256-jmQfihs4Y2u409a6G2geY6dOTUZ8btuDQhBjXTAOvDU=";
    };
    date = "2024-04-01";
  };
  fzf-fish = {
    pname = "fzf-fish";
    version = "v10.3";
    src = fetchFromGitHub {
      owner = "patrickF1";
      repo = "fzf.fish";
      rev = "v10.3";
      fetchSubmodules = false;
      sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
    };
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "5204646be15997ed101631d75df02512ecd6c2bb";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "5204646be15997ed101631d75df02512ecd6c2bb";
      fetchSubmodules = false;
      sha256 = "sha256-v00dbd4n3t/zyppgYcTIuZZkSmkxaJQEyIG1k7nk05s=";
    };
    date = "2024-04-30";
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
    version = "273fdde8ac5e51f3a223ba70980e52bbc09d9f6f";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "273fdde8ac5e51f3a223ba70980e52bbc09d9f6f";
      fetchSubmodules = false;
      sha256 = "sha256-D5OnXcvDqvR6PrEqrCCzP5LyV13e+XTtJmYt1c/jmVw=";
    };
    date = "2024-04-26";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "b129892f783740e6cf741f2ea09fa5dd512aa584";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "b129892f783740e6cf741f2ea09fa5dd512aa584";
      fetchSubmodules = false;
      sha256 = "sha256-h88kcUoKxX7BLOmYk472I2+KihXp7ni2QLurqs8XJSA=";
    };
    date = "2024-04-10";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "f3a31eba24587bc038592103d8f7e64648292115";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "f3a31eba24587bc038592103d8f7e64648292115";
      fetchSubmodules = false;
      sha256 = "sha256-JlA5/qU3U/uAuNt9iVIsIUnULxtxpzoO49ooF8MY3gw=";
    };
    date = "2024-04-23";
  };
  prometheus-api-client = {
    pname = "prometheus-api-client";
    version = "0.5.5";
    src = fetchurl {
      url = "https://pypi.org/packages/source/p/prometheus-api-client/prometheus-api-client-0.5.5.tar.gz";
      sha256 = "sha256-WUScS+BIXqWi37vtJILrCj7qyMExs+/IZt9MmgxAO7c=";
    };
  };
  puffer-fish = {
    pname = "puffer-fish";
    version = "12d062eae0ad24f4ec20593be845ac30cd4b5923";
    src = fetchFromGitHub {
      owner = "nickeb96";
      repo = "puffer-fish";
      rev = "12d062eae0ad24f4ec20593be845ac30cd4b5923";
      fetchSubmodules = false;
      sha256 = "sha256-2niYj0NLfmVIQguuGTA7RrPIcorJEPkxhH6Dhcy+6Bk=";
    };
    date = "2024-03-03";
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
    version = "e95dbc11fa57d738cd837cb659d50b73ec0a8d90";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "tmux.fish";
      rev = "e95dbc11fa57d738cd837cb659d50b73ec0a8d90";
      fetchSubmodules = false;
      sha256 = "sha256-tNq/F9NQZZ1pd0ZWPzQVwuHABCVECmXRN12ovGSUUFU=";
    };
    date = "2024-04-19";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "899d57b02eb329797773324a02dd7720fdba72f5";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "899d57b02eb329797773324a02dd7720fdba72f5";
      fetchSubmodules = false;
      sha256 = "sha256-S8BNV+V/m4AgbYi4I+4vqQzixTxiAppFmXXHHiqGXOs=";
    };
    date = "2024-04-29";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "899d57b02eb329797773324a02dd7720fdba72f5";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "899d57b02eb329797773324a02dd7720fdba72f5";
      fetchSubmodules = false;
      sha256 = "sha256-S8BNV+V/m4AgbYi4I+4vqQzixTxiAppFmXXHHiqGXOs=";
    };
    date = "2024-04-29";
  };
}

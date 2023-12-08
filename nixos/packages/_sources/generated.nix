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
    version = "50a3649ed91ba848f32d05961f35ae4fa7bdd9fc";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "50a3649ed91ba848f32d05961f35ae4fa7bdd9fc";
      fetchSubmodules = false;
      sha256 = "sha256-T79zdPzkIdzpqc7mEhqeWuYE2C5fagR27aE5vOpg3xU=";
    };
    date = "2023-10-19";
  };
  fzf-fish = {
    pname = "fzf-fish";
    version = "v10.2";
    src = fetchFromGitHub {
      owner = "patrickF1";
      repo = "fzf.fish";
      rev = "v10.2";
      fetchSubmodules = false;
      sha256 = "sha256-1/MLKkUHe4c9YLDrH+cnL+pLiSOSERbIZSM4FTG3wF0=";
    };
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "9fb6795474918b492d9ab01b1ebaf85e8bf6fe0b";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "9fb6795474918b492d9ab01b1ebaf85e8bf6fe0b";
      fetchSubmodules = false;
      sha256 = "sha256-0fpcYEdWfpy8MatH8cjalGOQ7/tau6ciiuSV1t09BlY=";
    };
    date = "2023-12-06";
  };
  k8s-snippets = {
    pname = "k8s-snippets";
    version = "fc461b4f6a8d10af103299a4e175e7c5527e3e27";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "fc461b4f6a8d10af103299a4e175e7c5527e3e27";
      fetchSubmodules = false;
      sha256 = "sha256-zUknVsKSUekDKzHWMLUn2PnBvazUbcOaojD2O5/3F9U=";
    };
    date = "2023-08-23";
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
    version = "v2.1.1";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "v2.1.1";
      fetchSubmodules = false;
      sha256 = "sha256-LVvrliJJQxyu12KMF0qRmf7KKAQ8tRHUzzW7rofjd1U=";
    };
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "9453e3d6cd2ca45d96e20f343e8f1b927364b630";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "9453e3d6cd2ca45d96e20f343e8f1b927364b630";
      fetchSubmodules = false;
      sha256 = "sha256-qrz6ppCtOxrDXjPrtdUWPr+bEdQ1sAYyHPME+rXVJCU=";
    };
    date = "2023-12-04";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "8b70e7f1e0a4119c1234c3bde4a01c241cabcc74";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "8b70e7f1e0a4119c1234c3bde4a01c241cabcc74";
      fetchSubmodules = false;
      sha256 = "sha256-YNcgtOQ4lHKPTWga5KlV0zYzLZ4NluGKOI6gSz5Es8s=";
    };
    date = "2023-12-01";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "a173b5776c66a31ce08552677c1eae7ab015835f";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "a173b5776c66a31ce08552677c1eae7ab015835f";
      fetchSubmodules = false;
      sha256 = "sha256-3OKnQA9ugCLEqvqaDzkqxi1VgPccpiKuOgoatYcPZUI=";
    };
    date = "2023-12-07";
  };
  prometheus-api-client = {
    pname = "prometheus-api-client";
    version = "0.5.4";
    src = fetchurl {
      url = "https://pypi.org/packages/source/p/prometheus-api-client/prometheus-api-client-0.5.4.tar.gz";
      sha256 = "sha256-OFaBB+GCqibyJZn3lCFeo93l7NPvFJRO72FO6qRsm2o=";
    };
  };
  puffer-fish = {
    pname = "puffer-fish";
    version = "5d3cb25e0d63356c3342fb3101810799bb651b64";
    src = fetchFromGitHub {
      owner = "nickeb96";
      repo = "puffer-fish";
      rev = "5d3cb25e0d63356c3342fb3101810799bb651b64";
      fetchSubmodules = false;
      sha256 = "sha256-aPxEHSXfiJJXosIm7b3Pd+yFnyz43W3GXyUB5BFAF54=";
    };
    date = "2023-03-15";
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
    version = "df5a050c81807cc72c45e87ec72bf6461c318c73";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "tmux.fish";
      rev = "df5a050c81807cc72c45e87ec72bf6461c318c73";
      fetchSubmodules = false;
      sha256 = "sha256-Z6fIPtYnyUEbVYHZtWNJ4W7l50P2xa3XYuENuz3zNiU=";
    };
    date = "2023-11-06";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "e9790345a6231cd6001f1356d578883fac52233a";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "e9790345a6231cd6001f1356d578883fac52233a";
      fetchSubmodules = false;
      sha256 = "sha256-Q9UnvmX+GpvqSmTwdjU4hsEsYhA887wPqs5pyqbIhmc=";
    };
    date = "2023-05-30";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "e9790345a6231cd6001f1356d578883fac52233a";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "e9790345a6231cd6001f1356d578883fac52233a";
      fetchSubmodules = false;
      sha256 = "sha256-Q9UnvmX+GpvqSmTwdjU4hsEsYhA887wPqs5pyqbIhmc=";
    };
    date = "2023-05-30";
  };
}

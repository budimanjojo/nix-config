# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "df01e4108be9f2e4092cd753ebfb46d04e6e47ce";
    src = fetchgit {
      url = "https://github.com/alker0/chezmoi.vim";
      rev = "df01e4108be9f2e4092cd753ebfb46d04e6e47ce";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-NjgyC9hRnyq0wP7nYVvKIV+vOperCOLvYWKpam56TUA=";
    };
    date = "2022-11-14";
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "3751eb5c56c67b51e68a1f4a0da28ae74ab771c1";
    src = fetchgit {
      url = "https://github.com/williamboman/mason-lspconfig.nvim";
      rev = "3751eb5c56c67b51e68a1f4a0da28ae74ab771c1";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-wEqFUCXN9QLoWXQsbUySeDNBmFH2wW8sSCKrpvR89xw=";
    };
    date = "2023-01-09";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "27f61f75a71bb3c2504a17e02b571f79cae43676";
    src = fetchgit {
      url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim";
      rev = "27f61f75a71bb3c2504a17e02b571f79cae43676";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-3m44aUe54+R+hd3Qp0kW5TeS/6rqyGT6kthpjaVzFX4=";
    };
    date = "2022-10-28";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "f8ca5648021ac6a59e016d81be594fa98f0705c2";
    src = fetchgit {
      url = "https://github.com/stevearc/oil.nvim";
      rev = "f8ca5648021ac6a59e016d81be594fa98f0705c2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-kMYYgrRTShd5CplZBBd1/zNNfQYwAFnJe5hwA7/VUcI=";
    };
    date = "2023-01-12";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "65f70be71e1dd0500a1f051d6f6c3c38898932b8";
    src = fetchgit {
      url = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
      rev = "65f70be71e1dd0500a1f051d6f6c3c38898932b8";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-zvaqMqHbkPYKS0hjRTT8FTxlFjMPjyX1Ss+Zl4oUWbg=";
    };
    date = "2023-01-11";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "65f70be71e1dd0500a1f051d6f6c3c38898932b8";
    src = fetchgit {
      url = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
      rev = "65f70be71e1dd0500a1f051d6f6c3c38898932b8";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-zvaqMqHbkPYKS0hjRTT8FTxlFjMPjyX1Ss+Zl4oUWbg=";
    };
    date = "2023-01-11";
  };
}

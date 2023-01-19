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
    version = "5b388c0de30f1605671ebfb9a20a620cda50ffce";
    src = fetchgit {
      url = "https://github.com/williamboman/mason-lspconfig.nvim";
      rev = "5b388c0de30f1605671ebfb9a20a620cda50ffce";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-261QcSPpGCkRFWfsqhviNJGoDLkbCo5aF9qk25mSAbA=";
    };
    date = "2023-01-19";
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
    version = "f5961e731f641206727eaded197e5879694c35f7";
    src = fetchgit {
      url = "https://github.com/stevearc/oil.nvim";
      rev = "f5961e731f641206727eaded197e5879694c35f7";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-YrfnXPy30YwvqxS4zDE2AWsl8GoUEmw9iVr0u1plnOA=";
    };
    date = "2023-01-19";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
    src = fetchgit {
      url = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
      rev = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-90V55pRfgiaP1huhD+3456ziJ2EU24iNQHt5Ro+g+M0=";
    };
    date = "2023-01-17";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
    src = fetchgit {
      url = "https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme";
      rev = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-90V55pRfgiaP1huhD+3456ziJ2EU24iNQHt5Ro+g+M0=";
    };
    date = "2023-01-17";
  };
}

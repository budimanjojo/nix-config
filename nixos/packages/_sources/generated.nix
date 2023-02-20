# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "9b9f0479856f5ce61daa1d5889ff379b18a109a5";
    src = fetchFromGitHub ({
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "9b9f0479856f5ce61daa1d5889ff379b18a109a5";
      fetchSubmodules = false;
      sha256 = "sha256-Cti0Clg/rPbO+tEWfdY+q3cCAwnB3l7MFRteSmrfigQ=";
    });
    date = "2023-02-10";
  };
  k8s-snippets = {
    pname = "k8s-snippets";
    version = "af0135aefbbb2d135789fd47609d1e8879b76bc1";
    src = fetchFromGitHub ({
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "af0135aefbbb2d135789fd47609d1e8879b76bc1";
      fetchSubmodules = false;
      sha256 = "sha256-DydkrDHEljMac94Y8sGNPddH59//xusER8tLH9B5jkk=";
    });
    date = "2023-02-20";
  };
  luasnip = {
    pname = "luasnip";
    version = "v1.2.1";
    src = fetchFromGitHub ({
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "v1.2.1";
      fetchSubmodules = false;
      sha256 = "sha256-6NJPOu5f5ycu9l53CZB7prVNj61UaVz706tOrk5c860=";
    });
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "93e58e100f37ef4fb0f897deeed20599dae9d128";
    src = fetchFromGitHub ({
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "93e58e100f37ef4fb0f897deeed20599dae9d128";
      fetchSubmodules = false;
      sha256 = "sha256-LBBrANy949YMHvW9sRoPZtVB6poFERGIqaJHNx6q3rQ=";
    });
    date = "2023-02-14";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "6ca38efeb0406dea8da6c97f61d6f6ef30ab0576";
    src = fetchFromGitHub ({
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "6ca38efeb0406dea8da6c97f61d6f6ef30ab0576";
      fetchSubmodules = false;
      sha256 = "sha256-4PErcgZHuHPq3BHkXYFqpwRJlj/XZYdt8wqPUis8kCg=";
    });
    date = "2023-01-26";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "f1ea6e0ad03e1d7b1acad4d0796d39c4a82b3463";
    src = fetchFromGitHub ({
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "f1ea6e0ad03e1d7b1acad4d0796d39c4a82b3463";
      fetchSubmodules = false;
      sha256 = "sha256-h2FWdP6ZHiSirzFXNH8vdwBfpqfbBUPcleX7PUT1WmI=";
    });
    date = "2023-02-11";
  };
  sad-nvim = {
    pname = "sad-nvim";
    version = "4cd87acbe4d9106ff2a42c4cd850dc5313bdc696";
    src = fetchFromGitHub ({
      owner = "ray-x";
      repo = "sad.nvim";
      rev = "4cd87acbe4d9106ff2a42c4cd850dc5313bdc696";
      fetchSubmodules = false;
      sha256 = "sha256-HijZK6xRx8pTvWlmtXHC50GAH8AHbsAn0yThYRT6cOQ=";
    });
    date = "2023-02-21";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
    src = fetchFromGitHub ({
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
      fetchSubmodules = false;
      sha256 = "sha256-90V55pRfgiaP1huhD+3456ziJ2EU24iNQHt5Ro+g+M0=";
    });
    date = "2023-01-17";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
    src = fetchFromGitHub ({
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "f7ae3421ac0d415ca57fb6224e093e12b8a980bb";
      fetchSubmodules = false;
      sha256 = "sha256-90V55pRfgiaP1huhD+3456ziJ2EU24iNQHt5Ro+g+M0=";
    });
    date = "2023-01-17";
  };
}

# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "df01e4108be9f2e4092cd753ebfb46d04e6e47ce";
    src = fetchFromGitHub ({
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "df01e4108be9f2e4092cd753ebfb46d04e6e47ce";
      fetchSubmodules = false;
      sha256 = "sha256-NjgyC9hRnyq0wP7nYVvKIV+vOperCOLvYWKpam56TUA=";
    });
    date = "2022-11-14";
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "faeeb5e02eba0aecdf273a50baa164300af33e77";
    src = fetchFromGitHub ({
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "faeeb5e02eba0aecdf273a50baa164300af33e77";
      fetchSubmodules = false;
      sha256 = "sha256-Ntk0olS//qKLWR1pHBhxqftBV7FJDeUFeoB+uq63W8s=";
    });
    date = "2023-01-23";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "27f61f75a71bb3c2504a17e02b571f79cae43676";
    src = fetchFromGitHub ({
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "27f61f75a71bb3c2504a17e02b571f79cae43676";
      fetchSubmodules = false;
      sha256 = "sha256-3m44aUe54+R+hd3Qp0kW5TeS/6rqyGT6kthpjaVzFX4=";
    });
    date = "2022-10-28";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "6c6b7673af1314dd7c8254a95eb8d331f6b76ac6";
    src = fetchFromGitHub ({
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "6c6b7673af1314dd7c8254a95eb8d331f6b76ac6";
      fetchSubmodules = false;
      sha256 = "sha256-RlZUL/C46H1/j4f/e7oCphN5J07sdD4/ujLNArjwWok=";
    });
    date = "2023-01-21";
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

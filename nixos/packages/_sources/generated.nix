# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "78e6c65620763e10dd41cd642496a726a133f028";
    src = fetchFromGitHub ({
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "78e6c65620763e10dd41cd642496a726a133f028";
      fetchSubmodules = false;
      sha256 = "sha256-6TBvwzjSt+Opff5xi+6Kojb43MC30jf/xGrJuPJ6Fw0=";
    });
    date = "2023-02-03";
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
    version = "53f3a8bdcb77d4a95b082fd57e12173f353c6c3e";
    src = fetchFromGitHub ({
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "53f3a8bdcb77d4a95b082fd57e12173f353c6c3e";
      fetchSubmodules = false;
      sha256 = "sha256-cNwt4uWxzGCWOB71Lp4wJylyaqGWEFmtEGk6JNzNCBU=";
    });
    date = "2023-01-31";
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
    version = "716dd8f9cf1ff2b9cda03497025612ce3c366307";
    src = fetchFromGitHub ({
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "716dd8f9cf1ff2b9cda03497025612ce3c366307";
      fetchSubmodules = false;
      sha256 = "sha256-9e3FqnGFQMdMwiP8xrNyyYGe7u2l60vE4KtQ4aIatc8=";
    });
    date = "2023-01-28";
  };
  sad-nvim = {
    pname = "sad-nvim";
    version = "1cdf3f25589dc92854913004443ba0e53bd103ad";
    src = fetchFromGitHub ({
      owner = "ray-x";
      repo = "sad.nvim";
      rev = "1cdf3f25589dc92854913004443ba0e53bd103ad";
      fetchSubmodules = false;
      sha256 = "sha256-6neCIpCEfxUwYdKZMsR3arILeuVMy6bfk/a5rSH1Wzo=";
    });
    date = "2023-01-30";
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

# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
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
    version = "3.1.4";
    src = fetchurl {
      url = "https://pypi.org/packages/source/a/alive-progress/alive-progress-3.1.4.tar.gz";
      sha256 = "sha256-dKldjQ1CvJnTo3JdvQbruFIkXxtk4wGnw3W5KyJmP3s=";
    };
  };
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "062717b6d67331856ecf75fd36eb0a7db4fbea0b";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "062717b6d67331856ecf75fd36eb0a7db4fbea0b";
      fetchSubmodules = false;
      sha256 = "sha256-tFoqnwPzwsIgun/fQHPGLQ7hdd2t8p68GcMpLwsBamc=";
    };
    date = "2023-03-01";
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "ab8b1f09603cc268770efd057115035dc6cfa83d";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "ab8b1f09603cc268770efd057115035dc6cfa83d";
      fetchSubmodules = false;
      sha256 = "sha256-nsyIgpI2y3iVmU8SQmsSNLWHXxCAt4z1YpEhFy0Hvog=";
    };
    date = "2023-04-27";
  };
  k8s-snippets = {
    pname = "k8s-snippets";
    version = "47456c4869a3bbc9d43653b17581511ef2e5fabb";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "47456c4869a3bbc9d43653b17581511ef2e5fabb";
      fetchSubmodules = false;
      sha256 = "sha256-kumdrVRIEe7Bmx7ZUx3PFL4obz8G9PKuuCqK6Omo4Uc=";
    };
    date = "2023-05-02";
  };
  krr = {
    pname = "krr";
    version = "v1.2.1";
    src = fetchFromGitHub {
      owner = "robusta-dev";
      repo = "krr";
      rev = "v1.2.1";
      fetchSubmodules = false;
      sha256 = "sha256-uRgOVfkoS02t7I1bP0fs6F4AN589nIcBHztagzt3utU=";
    };
  };
  luasnip = {
    pname = "luasnip";
    version = "v1.2.1";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "v1.2.1";
      fetchSubmodules = false;
      sha256 = "sha256-6NJPOu5f5ycu9l53CZB7prVNj61UaVz706tOrk5c860=";
    };
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "d381fcb78d7a562c3244e1c8f76406954649db36";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "d381fcb78d7a562c3244e1c8f76406954649db36";
      fetchSubmodules = false;
      sha256 = "sha256-lIdqihLKyfJV0dVo8JnIRweyBOUaHj8cEdBPvFhYzfE=";
    };
    date = "2023-06-12";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "49e3efe743d846d80da5a4757d4f7e563a96cb84";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "49e3efe743d846d80da5a4757d4f7e563a96cb84";
      fetchSubmodules = false;
      sha256 = "sha256-eUg8TYtLtzOR2bh1/5TZqA9hFH8khigF5WZwKY+Cqrw=";
    };
    date = "2023-06-11";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "a2b7ab5e99907ac04d75ce04d8dcd5728b0ad2f8";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "a2b7ab5e99907ac04d75ce04d8dcd5728b0ad2f8";
      fetchSubmodules = false;
      sha256 = "sha256-lU42D1LMKlpJCralqvxEUp+B9/QUs5cNS39YiLAB4HY=";
    };
    date = "2023-06-26";
  };
  prometheus-api-client = {
    pname = "prometheus-api-client";
    version = "0.5.3";
    src = fetchurl {
      url = "https://pypi.org/packages/source/p/prometheus-api-client/prometheus-api-client-0.5.3.tar.gz";
      sha256 = "sha256-mywpPCAgcuXPZxmanMQdXrMvAt2MwjxYR7YDzZzpm88=";
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

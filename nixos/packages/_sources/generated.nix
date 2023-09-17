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
    version = "0512b03d51f5af10f2c06cd484cf95a84d7695ec";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "0512b03d51f5af10f2c06cd484cf95a84d7695ec";
      fetchSubmodules = false;
      sha256 = "sha256-hbjemeLsKnIcbYgDlRiu6Py3kPb6JbyHUTze8bdNJNs=";
    };
    date = "2023-09-04";
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "5ad8dba19ce9b9fd8965598984dfdc9c119f97e4";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "5ad8dba19ce9b9fd8965598984dfdc9c119f97e4";
      fetchSubmodules = false;
      sha256 = "sha256-MF30YevxZUreW88RX/Tn9i/5GpqXqKcmH1tbDmsnoZY=";
    };
    date = "2023-08-15";
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
    version = "v2.0.0";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "v2.0.0";
      fetchSubmodules = false;
      sha256 = "sha256-bgQMU9hjqymzoIg+Ov+Ks18WrJPhwMIVCL3nDQkIdkM=";
    };
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "f014db32437aa61c86fc0ef1067cd2bc6a37205c";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "f014db32437aa61c86fc0ef1067cd2bc6a37205c";
      fetchSubmodules = false;
      sha256 = "sha256-lXqMbTwNnKATHZUbTwit6nAN3vgIWiotkzKXzIiNT3E=";
    };
    date = "2023-09-14";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "031903fefbf59371502092ef9e22cab9161d90ba";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "031903fefbf59371502092ef9e22cab9161d90ba";
      fetchSubmodules = false;
      sha256 = "sha256-lCEYt3lqlVrzazg1TdEtYnY32VjhJLdj2m36AjXURv0=";
    };
    date = "2023-07-13";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "da0553067e0982d92facf2f2ef1f709b97aed02e";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "da0553067e0982d92facf2f2ef1f709b97aed02e";
      fetchSubmodules = false;
      sha256 = "sha256-jDLfEoTcV6EFkMZVU0rTeIslW7AzBAdk/j2iC8bEBzM=";
    };
    date = "2023-09-17";
  };
  prometheus-api-client = {
    pname = "prometheus-api-client";
    version = "0.5.4";
    src = fetchurl {
      url = "https://pypi.org/packages/source/p/prometheus-api-client/prometheus-api-client-0.5.4.tar.gz";
      sha256 = "sha256-OFaBB+GCqibyJZn3lCFeo93l7NPvFJRO72FO6qRsm2o=";
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

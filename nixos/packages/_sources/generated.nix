# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "062717b6d67331856ecf75fd36eb0a7db4fbea0b";
    src = fetchFromGitHub ({
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "062717b6d67331856ecf75fd36eb0a7db4fbea0b";
      fetchSubmodules = false;
      sha256 = "sha256-tFoqnwPzwsIgun/fQHPGLQ7hdd2t8p68GcMpLwsBamc=";
    });
    date = "2023-03-01";
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "ab8b1f09603cc268770efd057115035dc6cfa83d";
    src = fetchFromGitHub ({
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "ab8b1f09603cc268770efd057115035dc6cfa83d";
      fetchSubmodules = false;
      sha256 = "sha256-nsyIgpI2y3iVmU8SQmsSNLWHXxCAt4z1YpEhFy0Hvog=";
    });
    date = "2023-04-27";
  };
  k8s-snippets = {
    pname = "k8s-snippets";
    version = "8626142673a4f34ee8b5af3460352359b7ac0514";
    src = fetchFromGitHub ({
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "8626142673a4f34ee8b5af3460352359b7ac0514";
      fetchSubmodules = false;
      sha256 = "sha256-fFiYWmKIEm06ryXWlpOpQF7c18iC6zxyperH0B2oSQM=";
    });
    date = "2023-04-18";
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
    version = "7276ffffcf51a8304b5fd4b81293be4ee010ec47";
    src = fetchFromGitHub ({
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "7276ffffcf51a8304b5fd4b81293be4ee010ec47";
      fetchSubmodules = false;
      sha256 = "sha256-BlNsTNzPu1VtW/abOqCpyjWqOzq7+h34O6Ef1pza1uY=";
    });
    date = "2023-04-27";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "a6c4d7df448a78b0a05fd2065bef11ed52bee51c";
    src = fetchFromGitHub ({
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "a6c4d7df448a78b0a05fd2065bef11ed52bee51c";
      fetchSubmodules = false;
      sha256 = "sha256-bedQamYO2m0MXJYfMyCq5WcZZLGE7kPK8wpLo5qH/aA=";
    });
    date = "2023-03-23";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "873ea3b85d1fba40e92059406c3f335dd57ffba1";
    src = fetchFromGitHub ({
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "873ea3b85d1fba40e92059406c3f335dd57ffba1";
      fetchSubmodules = false;
      sha256 = "sha256-x7WC4kX2h7wDQNkoc72gzMAEaSS4aR4DtvhGzqTM80Q=";
    });
    date = "2023-04-21";
  };
  sad-nvim = {
    pname = "sad-nvim";
    version = "869c7f3ca3dcd28fd78023db6a7e1bf8af0f4714";
    src = fetchFromGitHub ({
      owner = "ray-x";
      repo = "sad.nvim";
      rev = "869c7f3ca3dcd28fd78023db6a7e1bf8af0f4714";
      fetchSubmodules = false;
      sha256 = "sha256-uwXldYA7JdZHqoB4qfCnZcQW9YBjlRWmiz8mKb9jHuI=";
    });
    date = "2023-03-13";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "6e4ee110d8cbcd88b28b451595bf3a5a0ee194e1";
    src = fetchFromGitHub ({
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "6e4ee110d8cbcd88b28b451595bf3a5a0ee194e1";
      fetchSubmodules = false;
      sha256 = "sha256-DjDrcirM7ksb3Yu07wwUZInUr87mGI6nN420kgR+AOE=";
    });
    date = "2023-02-20";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "6e4ee110d8cbcd88b28b451595bf3a5a0ee194e1";
    src = fetchFromGitHub ({
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "6e4ee110d8cbcd88b28b451595bf3a5a0ee194e1";
      fetchSubmodules = false;
      sha256 = "sha256-DjDrcirM7ksb3Yu07wwUZInUr87mGI6nN420kgR+AOE=";
    });
    date = "2023-02-20";
  };
}

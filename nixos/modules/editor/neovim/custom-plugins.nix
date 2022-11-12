{ fetchFromGitHub, pkgs }:

{
  chezmoi-vim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "chezmoi-vim";
    version = "2022-10-12";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "7fd839d7fa275e7ffc4b11e2f1d99527c9024681";
      sha256 = "NasnIjIyHN3T0ivJEIgOe4beXjMMfzaony1b+AzHBoI=";
    };
  };
  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "mason-lspconfig-nvim";
    version = "2022-10-12";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "d2bcb38523a7f602e01ca0425ec44f4081362fb9";
      sha256 = "SGBS8ySGEm9sgVdZXX4eKgNd76/9Bk7cQ6beEOZuc1E=";
    };
  };
  mason-tool-installer-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "mason-tool-installer-nvim";
    version = "2022-10-12";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "ca4c6da43ab1f5687dc35da13dd6504acc912708";
      sha256 = "nBuJ0gxcjM5/iL4oWT3ByF1pzBKl9ZiYbnFCfhc8Qew=";
    };
  };
  lir-git-status-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "lir-git-status-nvim";
    version = "2022-10-12";
    src = fetchFromGitHub {
      owner = "tamago324";
      repo = "lir-git-status.nvim";
      rev = "6e15a3ade508522ecc027f059a814ca75a364db7";
      sha256 = "+ei/mMBbjKtUWVKW0p+pY5q/99+whSxekfJrtgr5ji4=";
    };
  };
}

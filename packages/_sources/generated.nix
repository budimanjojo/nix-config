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
  chezmoi-vim = {
    pname = "chezmoi-vim";
    version = "abf37336437867cbd99ce2f8849b717415391cc3";
    src = fetchFromGitHub {
      owner = "alker0";
      repo = "chezmoi.vim";
      rev = "abf37336437867cbd99ce2f8849b717415391cc3";
      fetchSubmodules = false;
      sha256 = "sha256-S1/myC1dEydi1F9a6XV0lJW3S/wWQe+A2ZXPo8GbtQo=";
    };
    date = "2024-07-26";
  };
  guihua-lua = {
    pname = "guihua-lua";
    version = "87bea7b98429405caf2a0ce4d029b027bb017c70";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "guihua.lua";
      rev = "87bea7b98429405caf2a0ce4d029b027bb017c70";
      fetchSubmodules = false;
      sha256 = "sha256-R/ckeCwzWixvL7q2+brvqcvfSK9Mx8pu6zOFgh2lde4=";
    };
    date = "2025-05-19";
  };
  k8s-snippets = {
    pname = "k8s-snippets";
    version = "ac225582362a1c640f07a2a059926ec5e3b2f42c";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "ac225582362a1c640f07a2a059926ec5e3b2f42c";
      fetchSubmodules = false;
      sha256 = "sha256-yn8dhMoxwvD8/GKZ9PNex4WL+ksVRo+RnlJi1bdOyCg=";
    };
    date = "2025-06-26";
  };
  luasnip = {
    pname = "luasnip";
    version = "v2.4.0";
    src = fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "v2.4.0";
      fetchSubmodules = false;
      sha256 = "sha256-FtDpvgbtKN9PN1cPXU0jdxj9VdScRE9W7P6d9rVftRQ=";
    };
  };
  mason-lspconfig-nvim = {
    pname = "mason-lspconfig-nvim";
    version = "bb3a17efc797c34c054463174e5522442576ebd8";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "bb3a17efc797c34c054463174e5522442576ebd8";
      fetchSubmodules = false;
      sha256 = "sha256-eDMo8gGc5JMUvwUHs6pzjPx7H1060XiRHvi70C8IlOI=";
    };
    date = "2025-07-19";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "517ef5994ef9d6b738322664d5fdd948f0fdeb46";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "517ef5994ef9d6b738322664d5fdd948f0fdeb46";
      fetchSubmodules = false;
      sha256 = "sha256-IeP3IGWfCNqr4nUIqpBjq9l++Lmp6YbMVimUu6UzMV0=";
    };
    date = "2025-06-26";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "bbad9a76b2617ce1221d49619e4e4b659b3c61fc";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "bbad9a76b2617ce1221d49619e4e4b659b3c61fc";
      fetchSubmodules = false;
      sha256 = "sha256-GhI6RwFg3Kep3CPGFCVnDPl8R6LMMz+kiSfIoR6nrfQ=";
    };
    date = "2025-07-02";
  };
  tmux-fish = {
    pname = "tmux-fish";
    version = "db0030b7f4f78af4053dc5c032c7512406961ea5";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "tmux.fish";
      rev = "db0030b7f4f78af4053dc5c032c7512406961ea5";
      fetchSubmodules = false;
      sha256 = "sha256-rRibn+FN8VNTSC1HmV05DXEa6+3uOHNx03tprkcjjs8=";
    };
    date = "2025-04-07";
  };
  tokyonight-gtk-theme = {
    pname = "tokyonight-gtk-theme";
    version = "803334a2d85ff60597e1ddd6a593462acc570298";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "803334a2d85ff60597e1ddd6a593462acc570298";
      fetchSubmodules = false;
      sha256 = "sha256-aJWyMz1FZnGOH5YXiGa9NBlNY5JRw7J7SWqt5XGKznU=";
    };
    date = "2025-07-21";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "803334a2d85ff60597e1ddd6a593462acc570298";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "803334a2d85ff60597e1ddd6a593462acc570298";
      fetchSubmodules = false;
      sha256 = "sha256-aJWyMz1FZnGOH5YXiGa9NBlNY5JRw7J7SWqt5XGKznU=";
    };
    date = "2025-07-21";
  };
}

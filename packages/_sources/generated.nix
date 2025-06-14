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
    version = "ba5ca9b1b12a3b1c3fb0237494380f4feff668c8";
    src = fetchFromGitHub {
      owner = "budimanjojo";
      repo = "k8s-snippets";
      rev = "ba5ca9b1b12a3b1c3fb0237494380f4feff668c8";
      fetchSubmodules = false;
      sha256 = "sha256-vVDKI9HR1QqJDHh10oZQ9Zr01gvJhj1iIEgwP+gssx8=";
    };
    date = "2023-12-13";
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
    version = "f17d02b928a18ab88a50d374be036ab5f499fde4";
    src = fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "f17d02b928a18ab88a50d374be036ab5f499fde4";
      fetchSubmodules = false;
      sha256 = "sha256-HwmpDWDcqjz57CoURdTcrRRRCs7yjO5hKvC0exlMoII=";
    };
    date = "2025-06-15";
  };
  mason-tool-installer-nvim = {
    pname = "mason-tool-installer-nvim";
    version = "93a9ff9b34c91c0cb0f7de8d5f7e4abce51d8903";
    src = fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "93a9ff9b34c91c0cb0f7de8d5f7e4abce51d8903";
      fetchSubmodules = false;
      sha256 = "sha256-FP6r+1iNKbXydW84ZSMeg59uhhLZYEEtRUqdDiL4Odo=";
    };
    date = "2025-05-30";
  };
  oil-nvim = {
    pname = "oil-nvim";
    version = "08c2bce8b00fd780fb7999dbffdf7cd174e896fb";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "oil.nvim";
      rev = "08c2bce8b00fd780fb7999dbffdf7cd174e896fb";
      fetchSubmodules = false;
      sha256 = "sha256-fbRbRT9VJdppOs4hML1J113qLHdj7YRuSDQgZkt34cM=";
    };
    date = "2025-06-04";
  };
  sad-nvim = {
    pname = "sad-nvim";
    version = "e7511767b59fcff237cc7209d47d08aba64b9f63";
    src = fetchFromGitHub {
      owner = "ray-x";
      repo = "sad.nvim";
      rev = "e7511767b59fcff237cc7209d47d08aba64b9f63";
      fetchSubmodules = false;
      sha256 = "sha256-CBX1EAch/cAE432g8/Tt8QqU8tIkTviXVdRyOwRyNEo=";
    };
    date = "2025-05-01";
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
    version = "006154c78dde52b5851347a7e91f924af62f1b8f";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "006154c78dde52b5851347a7e91f924af62f1b8f";
      fetchSubmodules = false;
      sha256 = "sha256-h5k9p++zjzxGFkTK/6o/ISl/Litgf6fzy8Jf6Ikt5V8=";
    };
    date = "2025-04-24";
  };
  tokyonight-icon-theme = {
    pname = "tokyonight-icon-theme";
    version = "006154c78dde52b5851347a7e91f924af62f1b8f";
    src = fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Tokyo-Night-GTK-Theme";
      rev = "006154c78dde52b5851347a7e91f924af62f1b8f";
      fetchSubmodules = false;
      sha256 = "sha256-h5k9p++zjzxGFkTK/6o/ISl/Litgf6fzy8Jf6Ikt5V8=";
    };
    date = "2025-04-24";
  };
}

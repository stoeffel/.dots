{ mylib, pkgs ? import <nixpkgs> { } }: {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovim/extra-config.vim;
  plugins = with pkgs.vimPlugins; [
    coc-nvim
    vim-scala
    idris-vim
    base16-vim
    vim-airline-themes
    dhall-vim
    vim-markdown
    (pkgs.vimUtils.buildVimPlugin {
      name = "ayu-vim";
      src = pkgs.fetchFromGitHub {
        owner = "ayu-theme";
        repo = "ayu-vim";
        rev = "9dab20b38335ed06738f251e92e3817182063759";
        sha256 = "0m914bnrnv7gy49qzfdp1zl3a1h7zpicvh2xqdfqhp7h96psxwmx";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "presenting";
      src = pkgs.fetchFromGitHub {
        owner = "sotte";
        repo = "presenting.vim";
        rev = "9fb8ccc626cda329c08a35c1df8deff67768a537";
        sha256 = "1098gps6vnmvvljcqbsx2a5z2syzan30dl95x7pfbs6q1hskj5k7";
      };
    })
  ];
}

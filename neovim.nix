{ pkgs ? import <nixpkgs> { } }:
with pkgs.vimPlugins;
with pkgs.nur-stoeffel.vimPlugins; {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovim/extra-config.vim;
  plugins = [
    agda-vim
    ayu-vim
    base16-vim
    coc-nvim
    dhall-vim
    idris-vim
    presenting-vim
    unicode-vim
    vim-airline-themes
    vim-markdown
    vim-scala
  ];
}

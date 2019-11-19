{ pkgs ? import <nixpkgs> { } }:
with pkgs.vimPlugins;
with pkgs.nur-stoeffel.vimPlugins; {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovim/extra-config.vim;
  plugins = [
    coc-nvim
    vim-scala
    idris-vim
    base16-vim
    vim-airline-themes
    dhall-vim
    vim-markdown
    ayu-vim
    presenting-vim
  ];
}

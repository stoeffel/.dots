{ pkgs ? import <nixpkgs> { } }:
let vimPlugins = import ./vimPlugins { inherit pkgs; };
in with pkgs.vimPlugins;
with vimPlugins; {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovim/extra-config.vim;
  plugins = [
    ayu-vim
    base16-vim
    coc-nvim
    dhall-vim
    fogbell-vim
    idris-vim
    night-owl-vim
    papercolor-theme
    presenting-vim
    unicode-vim
    vim-airline-themes
    vim-dim
    vim-markdown
    vim-noctu
    vim-scala
  ];
}

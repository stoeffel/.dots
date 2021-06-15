{ pkgs ? import <nixpkgs> { } }:
let
  vimPlugins = import ./vimPlugins { inherit pkgs; };

  unstable = (import ./unstable.nix).pkgs;
in with pkgs.vimPlugins;
with vimPlugins; {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovim/extra-config.vim;
  plugins = [
    NeoSolarized
    ayu-vim
    base16-vim
    coc-nvim
    dhall-vim
    fogbell-vim
    idris-vim
    night-owl-vim
    nord-vim
    onehalf-vim
    papercolor-theme
    presenting-vim
    typewriter-vim
    unicode-vim
    vim-airline-themes
    vim-dim
    vim-markdown
    vim-noctu
    vim-scala
    vim-textobj-user
    unstable.vimPlugins.nnn-vim
  ];
}

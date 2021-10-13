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
    ale
    ayu-vim
    base16-vim
    coc-nvim
    dhall-vim
    editorconfig-vim
    fogbell-vim
    fzf-vim
    haskell-vim
    idris-vim
    incsearch-vim
    neoformat
    night-owl-vim
    nord-vim
    onehalf-vim
    papercolor-theme
    presenting-vim
    quickfix-reflector-vim
    tabular
    typewriter-vim
    unicode-vim
    unstable.vimPlugins.nnn-vim
    vim-abolish
    vim-airline
    vim-airline-themes
    vim-commentary
    vim-dim
    vim-eunuch
    unstable.plenary-nvim
    unstable.gitsigns-nvim
    neoyank-vim
    neoterm
    vim-exchange
    vim-fugitive
    vim-highlightedyank
    vim-localvimrc
    vim-markdown
    vim-noctu
    vim-polyglot
    vim-repeat
    vim-rhubarb
    vim-scala
    vim-scriptease
    vim-sensible
    vim-speeddating
    vim-startify
    vim-surround
    vim-textobj-user
    vim-unimpaired
    vim-vinegar
  ];
}

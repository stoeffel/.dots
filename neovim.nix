{ pkgs ? import <nixpkgs> { } }:
let
  vimPlugins = import ./vimPlugins { inherit pkgs; };
  elm-pair = pkgs.fetchFromGitHub {
    owner = "jwoudenberg";
    repo = "elm-pair";
    rev = "release-14";
    sha256 = "F/SPN64pZ1/vYStlI7pyqQJMoq9wReVlvJ2CRsN/+yU=";
  };
in with pkgs.vimPlugins;
with vimPlugins; {
  enable = true;
  package = pkgs.neovim-nightly;
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
    gitsigns-nvim
    haskell-vim
    hop-nvim
    idris-vim
    incsearch-vim
    neoformat
    neoterm
    neoyank-vim
    night-owl-vim
    nord-vim
    onehalf-vim
    papercolor-theme
    plenary-nvim
    presenting-vim
    quickfix-reflector-vim
    tabular
    telescope-nvim
    typewriter-vim
    # nvim-treesitter
    # nvim-treesitter-refactor
    # nvim-treesitter-textobjects
    unicode-vim
    vim-abolish
    # vim-commentary
    vim-dim
    vim-eunuch
    vim-exchange
    vim-fugitive
    vim-highlightedyank
    vim-localvimrc
    vim-markdown
    vim-nix
    vim-noctu
    vim-polyglot
    vim-repeat
    vim-rhubarb
    vim-scala
    vim-scriptease
    vim-sensible
    vim-speeddating
    dashboard-nvim
    vim-surround
    vim-textobj-user
    vim-unimpaired
    vim-vinegar
    # ( pkgs.vimUtils.buildVimPlugin {
    #   name = "elm-pair";
    #   src = ~/src/tmp/elm-pair/neovim-plugin;
    # })
    (import elm-pair).neovim-plugin
  ];
}

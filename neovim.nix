{ pkgs ? import <nixpkgs> { } }:
let
  vimPlugins = import ./vimPlugins { inherit pkgs; };
  elm-pair = pkgs.fetchFromGitHub {
    owner = "jwoudenberg";
    repo = "elm-pair";
    rev = "release-latest";
    sha256 = "kRcuOxBOiQ4ljGnTcYoQqJhwvPwLKw4XwciG1pnWec4=";
  };

  pkgsUnstable = import <nixpkgs-unstable> { };
in with pkgsUnstable.vimPlugins;
with vimPlugins; {
  enable = true;
  package = pkgsUnstable.neovim-unwrapped;
  viAlias = true;
  vimAlias = true;
  extraConfig = builtins.readFile ./neovim/extra-config.vim;
  plugins = [
    NeoSolarized
    ale
    ayu-vim
    base16-vim
    dhall-vim
    editorconfig-vim
    fogbell-vim
    fzf-vim
    gitsigns-nvim
    haskell-vim
    hop-nvim
    idris-vim
    # incsearch-vim
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
    # vim-polyglot
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

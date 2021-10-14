{ pkgs ? import <nixpkgs> { }, unstable }:
let vimPlugins = import ./vimPlugins { inherit pkgs; };

in with pkgs.vimPlugins;
with vimPlugins; {
  enable = true;
  package = unstable.neovim-unwrapped;
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
    nvim-compe
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
    vim-airline
    vim-airline-themes
    vim-commentary
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
    vim-startify
    vim-surround
    vim-textobj-user
    vim-unimpaired
    vim-vinegar
  ];
}

{ config, pkgs ? import <nixpkgs> { }, ... }:
let
  hindent-imposter =
    pkgs.callPackage ./ormolu/hindent-imposter.nix { ormolu = pkgs.ormolu; };
  similarity-sort = pkgs.callPackage ./similarity-sort { };
  pkgsUnstable = import <nixpkgs-unstable> { };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "22.05";
  home.packages = with pkgs; [
    pkgsUnstable.jqp
    pkgsUnstable.zsh-forgit
    pkgsUnstable.rectangle
    pkgsUnstable.git-quick-stats
    thefuck
    tree-sitter
    pkgsUnstable.helix
    difftastic
    ncdu
    entr
    gifsicle
    ffmpeg
    autojump
    diff-so-fancy
    bat
    bfg-repo-cleaner
    cabal-install
    coreutils
    dhall
    dhall-json
    elmPackages.elm-live
    elmPackages.elm-language-server
    elmPackages.elm-format
    elmPackages.elm-json
    haskell-language-server
    haskellPackages.ghcide
    fasd
    fira-code
    fpp
    ghc
    ghcid
    gitAndTools.gh
    # gotop
    gcc
    gzip
    haskellPackages.hpack
    hindent-imposter
    jq
    lazygit
    libcxx
    niv
    nix-prefetch-git
    nixfmt
    nnn
    nodejs-16_x
    nodePackages.node-gyp
    purescript
    ripgrep
    ruby
    rubyPackages.solargraph
    rustup
    sbt
    scala
    scalafmt
    similarity-sort
    stack
    tmate
    kak-lsp
    sad
  ];
  home.file = {
    ".config/gotop/default.json".source = ./gotop.json;
    "Library/Application Support/jesseduffield/lazygit/config.yml".source =
      ./lazygit.yml;
    ".k9s/skin.yml".source = ./k9s_skin.yml;
    ".tmate.conf".source = ./tmux/tmate.conf;
    ".config/helix/config.toml".source = ./helix.toml;
    ".ignore".text = ''
      .git
    '';
  };
  programs = {
    kitty = import ./kitty.nix { inherit pkgs; };
    direnv = { enable = true; };
    git = import ./git.nix { inherit pkgs; };
    fzf = import ./fzf.nix { inherit pkgs; };
    neovim = import ./neovim.nix { inherit pkgs; };
    starship = import ./starship.nix { inherit pkgs; };
    tmux = import ./tmux.nix { inherit pkgs; };
    zsh = import ./zsh.nix { inherit pkgs; };
    alacritty = import ./alacritty.nix { inherit pkgs; };
    kakoune = import ./kakoune.nix { inherit pkgs; };
  };
}

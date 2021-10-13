{ config, pkgs ? import <nixpkgs> { }, unstable ? import <unstable> { }, ... }:
let
  hindent-imposter =
    pkgs.callPackage ./ormolu/hindent-imposter.nix { ormolu = pkgs.ormolu; };
  similarity-sort = pkgs.callPackage ./similarity-sort { };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    autojump
    diff-so-fancy
    bat
    bfg-repo-cleaner
    cabal-install
    clang_8
    coreutils
    dhall
    dhall-json
    elmPackages.elm-live
    fasd
    fira-code
    fpp
    ghc
    ghcid
    gitAndTools.gh
    gotop
    gzip
    haskellPackages.hpack
    hindent-imposter
    jq
    lazygit
    libcxx
    llvmPackages.libclang
    llvm_8
    niv
    nix-prefetch-git
    nixfmt
    nnn
    nodejs-12_x
    purescript
    python3
    ripgrep
    ruby
    rustup
    sbt
    scala
    scalafmt
    similarity-sort
    stack
    tmate
  ];
  home.file = {
    "/Applications/Alacritty.app".source =
      "${pkgs.alacritty}/Applications/Alacritty.app";
    ".config/nvim/coc-settings.json".source = ./neovim/coc-settings.json;
    ".config/gotop/default.json".source = ./gotop.json;
    "Library/Application Support/jesseduffield/lazygit/config.yml".source =
      ./lazygit.yml;
    ".k9s/skin.yml".source = ./k9s_skin.yml;
    ".tmate.conf".source = ./tmux/tmate.conf;
    ".ignore".text = ''
      .git
    '';
  };
  programs = {
    alacritty = import ./alacritty.nix { inherit pkgs; };
    kitty = import ./kitty.nix { inherit pkgs; };
    direnv = { enable = true; };
    git = import ./git.nix { inherit pkgs; };
    fzf = import ./fzf.nix { inherit pkgs; };
    neovim = import ./neovim.nix {
      inherit pkgs;
      inherit unstable;
    };
    starship = import ./starship.nix { inherit pkgs; };
    tmux = import ./tmux.nix { inherit pkgs; };
    zsh = import ./zsh.nix { inherit pkgs; };
  };
}

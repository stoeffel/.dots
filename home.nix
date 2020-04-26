{ config, pkgs ? import <nixpkgs> { }, ... }:
let
  unstable = (import ./unstable.nix).pkgs;
  lazygit = unstable.lazygit;
  gotop = unstable.gotop;
  ormolu = unstable.ormolu;
  hindent-imposter =
    pkgs.callPackage ./ormolu/hindent-imposter.nix { inherit ormolu; };
  similarity-sort = pkgs.callPackage ./similarity-sort { };
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    autojump
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
    gzip
    haskellPackages.hpack
    hindent-imposter
    jq
    lazygit
    libcxx
    llvmPackages.libclang
    llvm_8
    nix-prefetch-git
    nixfmt
    nodejs-12_x
    ormolu
    python3
    ripgrep
    ruby
    rustup
    sbt
    scala
    scalafmt
    similarity-sort
    stack
    gotop
  ];

  home.file = {
    "/Applications/Alacritty.app".source =
      "${pkgs.alacritty}/Applications/Alacritty.app";
    ".config/nvim/coc-settings.json".source = ./neovim/coc-settings.json;
    ".ignore".text = ''
      .git
    '';
  };
  programs = {
    alacritty = import ./alacritty.nix { inherit pkgs; };
    direnv = { enable = true; };
    git = import ./git.nix { inherit pkgs; };
    fzf = import ./fzf.nix { inherit pkgs; };
    neovim = import ./neovim.nix { inherit pkgs; };
    starship = import ./starship.nix { inherit pkgs; };
    tmux = import ./tmux.nix { inherit pkgs; };
    zsh = import ./zsh.nix { inherit pkgs; };
  };
}

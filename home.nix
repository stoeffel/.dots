{ config, pkgs ? import <nixpkgs> { }, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    (pkgs.callPackage ./similarity-sort { })
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
    jq
    libcxx
    llvmPackages.libclang
    llvm_8
    nix-prefetch-git
    nixfmt
    nodejs-12_x
    python3
    ripgrep
    ruby
    rustup
    sbt
    scala
    scalafmt
    stack
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

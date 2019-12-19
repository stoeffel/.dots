{ config, pkgs ? import <nixpkgs> { }, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    autojump
    bat
    cabal-install
    coreutils
    dhall
    dhall-json
    elmPackages.elm-live
    fasd
    fira-code
    ghc
    ghcid
    gzip
    haskellPackages.Agda
    haskellPackages.hpack
    jq
    nix-prefetch-git
    nixfmt
    nodejs-12_x
    nur-stoeffel.agda-stdlib
    nur-stoeffel.hindent-imposter
    nur-stoeffel.ormolu
    ripgrep
    ruby
    rustup
    sbt
    scala
    scalafmt
  ];

  home.file = {
    "/Applications/Alacritty.app".source =
      "${pkgs.alacritty}/Applications/Alacritty.app";
    ".config/nvim/coc-settings.json".source = ./neovim/coc-settings.json;
    ".agda/standard-library.agda-lib".text = ''
      name: standard-library
      include: ${pkgs.nur-stoeffel.agda-stdlib}/share/agda
    '';
    ".agda/libraries".text = ''
      ~/.agda/standard-library.agda-lib
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

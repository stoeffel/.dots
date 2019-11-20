{ config, pkgs ? import <nixpkgs> { }, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    autojump
    bat
    cabal-install
    coreutils
    fasd
    fira-code
    ghc
    ghcid
    haskellPackages.hpack
    nix-prefetch-git
    nixfmt
    nodejs-12_x
    nur-stoeffel.hindent-imposter
    nur-stoeffel.ormolu
    ripgrep
    rustup
  ];

  home.file = {
    "/Applications/Alacritty.app".source =
      "${pkgs.alacritty}/Applications/Alacritty.app";
    ".config/nvim/coc-settings.json".source = ./neovim/coc-settings.json;
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

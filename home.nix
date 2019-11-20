{ config, pkgs ? import <nixpkgs> { }, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = [
    pkgs.autojump
    pkgs.bat
    pkgs.cabal-install
    pkgs.coreutils
    pkgs.fasd
    pkgs.fira-code
    pkgs.ghc
    pkgs.ghcid
    pkgs.nix-prefetch-git
    pkgs.nixfmt
    pkgs.nodejs-12_x
    pkgs.ripgrep
    pkgs.rustup
    pkgs.nur-stoeffel.ormolu
    pkgs.nur-stoeffel.hindent-imposter
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

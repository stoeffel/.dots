{ config, pkgs ? import <nixpkgs> { }, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.autojump
    pkgs.bat
    pkgs.direnv
    pkgs.fasd
    pkgs.nix-prefetch-git
    pkgs.nixfmt
    pkgs.nodejs-12_x
    pkgs.ripgrep
    pkgs.zsh
  ];

  home.file = {
    "/Applications/Alacritty.app".source =
      "${pkgs.alacritty}/Applications/Alacritty.app";
    ".config/nvim/coc-settings.json".source = ./neovim/coc-settings.json;
  };
  programs = {
    alacritty = import ./alacritty.nix { inherit pkgs; };
    git = import ./git.nix { inherit pkgs; };
    neovim = import ./neovim.nix { inherit pkgs; };
    tmux = import ./tmux.nix { inherit pkgs; };
    zsh = import ./zsh.nix { inherit pkgs; };
  };
}

{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.alacritty = import ./alacritty.nix {};
  programs.tmux = import ./tmux.nix {};
  home.packages = with pkgs; [
    fortune
    neovim
    nix-prefetch-git
    zsh
  ];

  home.file."/Applications/Alacritty.app".source = "${pkgs.alacritty}/Applications/Alacritty.app";
}

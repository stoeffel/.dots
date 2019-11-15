{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.alacritty = import ./alacritty.nix {};
  programs.tmux = import ./tmux.nix { inherit pkgs; };
  home.packages = with pkgs; [
    neovim
    nix-prefetch-git
    zsh
  ];

  home.file."/Applications/Alacritty.app".source = "${pkgs.alacritty}/Applications/Alacritty.app";
  home.file.".zshrc".source = ./zshrc;
  home.file.".whimsical.vim".source = ./whimsical.vim;
  home.file.".vimrc".source = ./whimsical.vim;
  home.file.".config/nvim/init.vim".source = ./whimsical.vim;
  home.file.".config/nvim/coc-settings.json".source = ./coc-settings.json;
  home.file.".gitignore".source = ./gitignore;
  home.file.".gitconfig".source = ./gitconfig;
}

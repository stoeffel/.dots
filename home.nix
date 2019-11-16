{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.alacritty = import ./alacritty.nix {};
  programs.tmux = import ./tmux.nix { inherit pkgs; };
  home.packages = with pkgs; [
    bat
    neovim
    nix-prefetch-git
    zsh
  ];

  home.file = {
    "/Applications/Alacritty.app".source = "${pkgs.alacritty}/Applications/Alacritty.app";

    ".zshrc".text = builtins.readFile ./zshrc;
    ".antigen.zsh".text = builtins.readFile ./zsh/antigen.zsh;

    ".whimsical.vim".text = builtins.readFile ./vim/whimsical.vim;
    ".vimrc".text = builtins.readFile ./vim/whimsical.vim;
    ".config/nvim/init.vim".text = builtins.readFile ./vim/whimsical.vim;
    ".config/nvim/coc-settings.json".text = builtins.readFile ./vim/coc-settings.json;

    ".gitignore".text = builtins.readFile ./git/gitignore;
    ".gitconfig".text = builtins.readFile ./git/gitconfig;
  };
}

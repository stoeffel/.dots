{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    antigen
    bat
    neovim
    nix-prefetch-git
    zsh
  ];

  home.file = {
    "/Applications/Alacritty.app".source = "${pkgs.alacritty}/Applications/Alacritty.app";

    ".antigen.zsh".text = builtins.readFile ./zsh/antigen.zsh;

    ".whimsical.vim".text = builtins.readFile ./vim/whimsical.vim;
    ".vimrc".text = builtins.readFile ./vim/whimsical.vim;
    ".config/nvim/init.vim".text = builtins.readFile ./vim/whimsical.vim;
    ".config/nvim/coc-settings.json".text = builtins.readFile ./vim/coc-settings.json;

    ".gitignore".text = builtins.readFile ./git/gitignore;
    ".gitconfig".text = builtins.readFile ./git/gitconfig;
  };
  programs = {
    alacritty = import ./alacritty.nix {};
    tmux = import ./tmux.nix { inherit pkgs; };
    zsh = import ./zsh.nix { inherit pkgs; };
  };
}

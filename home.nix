{ config, pkgs ? import <nixpkgs> { }, ... }:
let
  mylib = import ./lib.nix { inherit pkgs; };
  callPackage = mylib.makeCallPackage (pkgs // { inherit mylib; });
in {
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
    alacritty = callPackage ./alacritty.nix { };
    git = callPackage ./git.nix { };
    neovim = callPackage ./neovim.nix { };
    tmux = callPackage ./tmux.nix { };
    zsh = callPackage ./zsh.nix { };
  };
}

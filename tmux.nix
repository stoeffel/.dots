{ pkgs ? import <nixpkgs> { } }:
let
  statusbar = builtins.readFile ./tmux/statusbar.conf;
  keybindings = builtins.readFile ./tmux/keybindings.conf;
  helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  tmuxinator.enable = true;
  keyMode = "vi";
  secureSocket = false;
  shortcut = "b";
  customPaneNavigationAndResize = true;
  plugins = with pkgs.tmuxPlugins; [
    battery
    continuum
    pain-control
    resurrect
    fpp
  ];
  extraConfig = unlines [
    "set -g status-position top"
    ''set -g default-terminal "xterm-256color"''
    "set -g mouse on"

    keybindings
    statusbar
  ];
}

{ pkgs ? import <nixpkgs> { } }:
let
  statusbar = builtins.readFile ./tmux/statusbar.conf;
  keybindings = builtins.readFile ./tmux/keybindings.conf;
in {
  enable = true;
  tmuxinator.enable = true;
  keyMode = "vi";
  secureSocket = false;
  shortcut = "b";
  customPaneNavigationAndResize = true;
  plugins = with pkgs.tmuxPlugins; [ battery continuum pain-control resurrect ];
  extraConfig =
    pkgs.nur-stoeffel.lib.unlines [ "set -g mouse on" keybindings statusbar ];
}

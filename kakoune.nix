{ pkgs ? import <nixpkgs> { } }:
let
  pkgsUnstable = import <nixpkgs-unstable> { };
in with pkgsUnstable.kakounePlugins;
 {
  enable = true;
  config = {
    colorScheme = "plain";
    keyMappings = [
        {
            mode = "normal";
             key = "<space>";
         effect = ":fzf-mode<ret>";
        }
    ];
  };
  plugins = [
    powerline-kak
    fzf-kak
    auto-pairs-kak
  ];
}

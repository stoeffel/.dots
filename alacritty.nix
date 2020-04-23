{ pkgs ? import <nixpkgs> { } }:
let helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  settings = {
    live_config_reload = true;
    window = {
      dynamic_padding = true;
      decorations = "transparent";
      startup_mode = "Windowed";
      padding.x = 25;
      padding.y = 35;
    };
    font = {
      size = 18.0;
      normal.family = "Operator Mono";
      normal.style = "Book";
    };
  } // readJSON ./alacritty/ayu-dark.json;
}

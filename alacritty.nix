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
      size = 16.0;
      normal.family = "Fira Code";
      normal.style = "Retina";
    };
  } // readJSON ./alacritty/hyper.json;
}

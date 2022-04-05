{ pkgs ? import <nixpkgs> { } }:
let helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  settings = {
    live_config_reload = true;
    window = {
      dynamic_padding = true;
      decorations = "none";
      startup_mode = "Maximized";
      padding.x = 25;
      padding.y = 35;
    };
    font = {
      size = 14.0;
      normal.family = "FiraCode Nerd Font Mono";
      normal.style = "Regular";
      bold.style = "Bold";
      italic.style = "Light Italic";
      bold_italic.style = "Bold Italic";
    };
  } // readJSON ./alacritty/nightfox.json;
}

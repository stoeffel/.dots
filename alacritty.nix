{ pkgs ? import <nixpkgs> { } }:
let theme = pkgs.nur-stoeffel.lib.readJSON ./alacritty/ayu-light.json;
in {
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
  } // theme;
}

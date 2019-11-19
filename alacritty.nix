{ pkgs ? import <nixpkgs> { } }:
let theme = pkgs.nur-stoeffel.lib.readJSON ./alacritty/ayu-dark.json;
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
      size = 18.0;
      normal.family = "Operator Mono";
      normal.style = "Book";
    };
  } // theme;
}

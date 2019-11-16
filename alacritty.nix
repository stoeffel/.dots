{}:
let
  theme = builtins.fromJSON (
    builtins.readFile ./alacritty/ayu-dark.json
  );
in
{ enable = true;
  settings = {
    live_config_reload = true;
    window = {
      dynamic_padding = true;
      decorations = "transparent";
      startup_mode = "Windowed";
      padding = {
        x = 20;
        y = 25;
      };
    };
    font = {
      size = 18.0;
      normal = {
        family = "Operator Mono";
        style = "Book";
      };
    };
  } // theme;
}

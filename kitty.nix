{ pkgs ? import <nixpkgs> { } }:
let helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  settings = {
    allow_remote_control = "yes";
    clipboard_control = "write-clipboard write-primary no-append";
    macos_option_as_alt = "both";

    font_family = "Operator Mono";
    bold_font = "Bold";
    italic_font = "Book Italic";
    bold_italic_font = "Bold Italic";
    font_size = "18.0";

    url_style = "single";

    cursor_blink_interval = "0";

    enable_audio_bell = "no";
    visual_bell_duration = "0.0";

    window_padding_width = "6.0";
    hide_window_decorations = "yes";

    # # Ayu Light

    # background = "#fafafa";
    # foreground = "#5b6673";
    # cursor = "#ff6900";
    # selection_background = "#f0ede4";
    # color0 = "#000000";
    # color8 = "#323232";
    # color1 = "#ff3333";
    # color9 = "#ff6565";
    # color2 = "#86b200";
    # color10 = "#b8e532";
    # color3 = "#f19618";
    # color11 = "#ffc849";
    # color4 = "#41a6d9";
    # color12 = "#73d7ff";
    # color5 = "#f07078";
    # color13 = "#ffa3aa";
    # color6 = "#4cbe99";
    # color14 = "#7ff0cb";
    # color7 = "#ffffff";
    # color15 = "#ffffff";
    # selection_foreground = "#fafafa";

    # # Solarized Light
    background = "#fdf6e3";
    foreground = "#52676f";
    cursor = "#52676f";
    selection_background = "#e9e2cb";
    color0 = "#e4e4e4";
    color8 = "#ffffd7";
    color1 = "#d70000";
    color9 = "#d75f00";
    color2 = "#5f8700";
    color10 = "#585858";
    color3 = "#af8700";
    color11 = "#626262";
    color4 = "#0087ff";
    color12 = "#808080";
    color5 = "#af005f";
    color13 = "#5f5faf";
    color6 = "#00afaf";
    color14 = "#8a8a8a";
    color7 = "#262626";
    color15 = "#1c1c1c";
    selection_foreground = "#fcf4dc";
  };
}

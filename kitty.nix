{ pkgs ? import <nixpkgs> { } }:
let helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  settings = {
    allow_remote_control = "yes";
    clipboard_control = "write-clipboard write-primary no-append";
    macos_option_as_alt = "both";

    font_family = "Victor Mono Regular";
    bold_font = "Victor Mono Bold";
    italic_font = "Victor Mono Light Italic";
    bold_italic_font = "Victor Mono Bold Italic";
    font_size = "20.0";
    disable_ligatures = "never";

    url_style = "single";

    cursor_blink_interval = "0";

    enable_audio_bell = "no";
    visual_bell_duration = "0.0";

    window_padding_width = "6.0";
    hide_window_decorations = "yes";

    # # # Ayu Light

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

    # Solarized Light
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

    # # Solarized Dark high contrast
    # background = "#001e26";
    # foreground = "#9bc1c2";
    # cursor = "#f34a00";
    # selection_background = "#003747";
    # color0 = "#002731";
    # color8 = "#006388";
    # color1 = "#d01b24";
    # color9 = "#f4153b";
    # color2 = "#6bbe6c";
    # color10 = "#50ee84";
    # color3 = "#a57705";
    # color11 = "#b17e28";
    # color4 = "#2075c7";
    # color12 = "#178dc7";
    # color5 = "#c61b6e";
    # color13 = "#e14d8e";
    # color6 = "#259185";
    # color14 = "#00b29e";
    # color7 = "#e9e2cb";
    # color15 = "#fcf4dc";
    # selection_foreground = "#001e26";

    # Ayu Dark

    #foreground = "#bfbab0";
    #background = "#0f1419";

    #selection_foreground = "#0f1419";
    #selection_background = "#ffb454";

    #color0 = "#9da2a6";
    #color8 = "#d9dbdd";

    ##: black

    #color1 = "#ff3333";
    #color9 = "#f51818";

    ##: red

    #color2 = " #bae67e";
    #color10 = "#c2d94c";

    ##: green

    #color3 = " #ffcc66";
    #color11 = "#f29718";

    ##: yellow

    #color4 = " #73d0ff";
    #color12 = "#59c2ff";

    ##: blue

    #color5 = " #d4bfff";
    #color13 = "#b77ee0";

    ##: magenta

    #color6 = " #83cec6";
    #color14 = "#5ccfe6";

    ##: cyan

    #color7 = " #f0f0f0";
    #color15 = "#ffffff";

    ##: white

    # Nord theme - ported from https://github.com/arcticicestudio/nord-hyper
    # foreground = "#D8DEE9";
    # background = "#2E3440";
    # selection_foreground = "#000000";
    # selection_background = "#FFFACD";
    # url_color = "#0087BD";
    # cursor = "#81A1C1";
    # # black
    # color0 = "#3B4252";
    # color8 = "#4C566A";
    # # red
    # color1 = "#BF616A";
    # color9 = "#BF616A";
    # # green
    # color2 = "#A3BE8C";
    # color10 = "#A3BE8C";
    # # yellow
    # color3 = "#EBCB8B";
    # color11 = "#EBCB8B";
    # # blue
    # color4 = "#81A1C1";
    # color12 = "#81A1C1";
    # # magenta
    # color5 = "#B48EAD";
    # color13 = "#B48EAD";
    # # cyan
    # color6 = "#88C0D0";
    # color14 = "#8FBCBB";
    # # white
    # color7 = "#E5E9F0";
    # color15 = "#B48EAD";
  };
}

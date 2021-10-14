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
    # background = "#fdf6e3";
    # foreground = "#52676f";
    # cursor = "#52676f";
    # selection_background = "#e9e2cb";
    # color0 = "#e4e4e4";
    # color8 = "#ffffd7";
    # color1 = "#d70000";
    # color9 = "#d75f00";
    # color2 = "#5f8700";
    # color10 = "#585858";
    # color3 = "#af8700";
    # color11 = "#626262";
    # color4 = "#0087ff";
    # color12 = "#808080";
    # color5 = "#af005f";
    # color13 = "#5f5faf";
    # color6 = "#00afaf";
    # color14 = "#8a8a8a";
    # color7 = "#262626";
    # color15 = "#1c1c1c";
    # selection_foreground = "#fcf4dc";

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

    ## name: Tokyo Night Storm
    ### license: MIT
    ### author: Folke Lemaitre
    ### upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/kitty_tokyonight_storm.conf
    background = "#24283b";
    foreground = "#c0caf5";
    selection_background = "#364A82";
    selection_foreground = "#c0caf5";
    url_color = "#73daca";
    cursor = "#c0caf5";
    # Tabs
    active_tab_background = "#7aa2f7";
    active_tab_foreground = "#1f2335";
    inactive_tab_background = "#292e42";
    inactive_tab_foreground = "#545c7e";
    #tab_bar_background #1D202F
    # normal
    color0 = "#1D202F";
    color1 = "#f7768e";
    color2 = "#9ece6a";
    color3 = "#e0af68";
    color4 = "#7aa2f7";
    color5 = "#bb9af7";
    color6 = "#7dcfff";
    color7 = "#a9b1d6";
    # bright
    color8 = "#414868";
    color9 = "#f7768e";
    color10 = "#9ece6a";
    color11 = "#e0af68";
    color12 = "#7aa2f7";
    color13 = "#bb9af7";
    color14 = "#7dcfff";
    color15 = "#c0caf5";
    # extended colors = "
    color16 = "#ff9e64";
    color17 = "#db4b4b";

    ### name: Tokyo Night Day
    ### license = " MIT";
    ### author: Folke Lemaitre
    ### upstream: https://github.com = "folke/tokyonight.nvim/raw/main/extras/kitty_tokyonight_day.conf";
    #background = "#e1e2e7";
    #foreground = "#3760bf";
    #selection_background = "#99a7df";
    #selection_foreground = "#3760bf";
    #url_color = "#387068";
    #cursor = "#3760bf";
    ## Tabs
    #active_tab_background = "#2e7de9";
    #active_tab_foreground = "#d4d6e4";
    #inactive_tab_background = "#c4c8da";
    #inactive_tab_foreground = "#8990b3";
    ##tab_bar_background = "#e9e9ed";
    ## normal
    #color0 = "#e9e9ed";
    #color1 = "#f52a65";
    #color2 = "#587539";
    #color3 = "#8c6c3e";
    #color4 = "#2e7de9";
    #color5 = "#9854f1";
    #color6 = "#007197";
    #color7 = "#6172b0";
    ## bright
    #color8 = "#a1a6c5";
    #color9 = "#f52a65";
    #color10 = "#587539";
    #color11 = "#8c6c3e";
    #color12 = "#2e7de9";
    #color13 = "#9854f1";
    #color14 = "#007197";
    #color15 = "#3760bf";
    ## extended colors = "
    #color16 = "#b15c00";
    #color17 = "#c64343";

    ### name: Tokyo Night
    ### license = " MIT";
    ### author: Folke Lemaitre
    ### upstream: https://github.com = "folke/tokyonight.nvim/raw/main/extras/kitty_tokyonight_night.conf";
    #background = "#1a1b26";
    #foreground #c0caf5 = "
    #selection_background = "#33467C";
    #selection_foreground = "#c0caf5";
    #url_color = "#73daca";
    #cursor = "#c0caf5";
    ## Tabs
    #active_tab_background = "#7aa2f7";
    #active_tab_foreground = "#1f2335";
    #inactive_tab_background = "#292e42";
    #inactive_tab_foreground = "#545c7e";
    ##tab_bar_background = "#15161E";
    ## normal
    #color0 = "#15161E";
    #color1 = "#f7768e";
    #color2 = "#9ece6a";
    #color3 = "#e0af68";
    #color4 = "#7aa2f7";
    #color5 = "#bb9af7";
    #color6 = "#7dcfff";
    #color7 = "#a9b1d6";
    ## bright
    #color8 = "#414868";
    #color9 = "#f7768e";
    #color10 = "#9ece6a";
    #color11 = "#e0af68";
    #color12 = "#7aa2f7";
    #color13 = "#bb9af7";
    #color14 = "#7dcfff";
    #color15 = "#c0caf5";
    ## extended colors = "
    #color16 = "#ff9e64";
    #color17 = "#db4b4b";
  };
}

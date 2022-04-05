{ pkgs ? import <nixpkgs> { } }:
let helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  settings = {
    allow_remote_control = "yes";
    clipboard_control = "write-clipboard write-primary no-append";
    macos_option_as_alt = "both";

    font_family = "FiraCode Nerd Font Mono";
    bold_font = "FiraCode Nerd Font Mono Bold";
    italic_font = "FiraCode Nerd Font Mono Light Italic";
    bold_italic_font = "FiraCode Nerd Font Mono Bold Italic";
    font_size = "14.0";
    disable_ligatures = "never";
    darwinLaunchOptions = ''
      [
        "--single-instance"
        "--listen-on=unix:/tmp/my-socket"
      ]
    '';
    url_style = "single";

    cursor_blink_interval = "0";

    enable_audio_bell = "no";
    visual_bell_duration = "0.0";

    window_padding_width = "6.0";
    hide_window_decorations = "yes";
    # Nightfox colors for Kitty
    ## name: dawnfox
    ## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/dawnfox/nightfox_kitty.conf

    background = "#faf4ed";
    foreground = "#575279";
    selection_background = "#d0d8d8";
    selection_foreground = "#575279";
    url_color = "#618774";
    cursor = "#575279";

    # Tabs
    active_tab_background = "#286983";
    active_tab_foreground = "#ebe5df";
    inactive_tab_background = "#d0d8d8";
    inactive_tab_foreground = "#9893a5";

    # normal
    color0 = "#575279";
    color1 = "#b4637a";
    color2 = "#618774";
    color3 = "#ea9d34";
    color4 = "#286983";
    color5 = "#907aa9";
    color6 = "#56949f";
    color7 = "#e5e9f0";

    # bright =
    color8 = "#5f5695";
    color9 = "#c26d85";
    color10 = "#629f81";
    color11 = "#eea846";
    color12 = "#2d81a3";
    color13 = "#9a80b9";
    color14 = "#5ca7b4";
    color15 = "#e6ebf3";

    # extended colors
    color16 = "#d7827e";
    color17 = "#d685af";

    # # Nightfox colors for Kitty
    # ## name: nightfox
    # ## upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_kitty.conf
    #
    # background = "#192330";
    # foreground = "#cdcecf";
    # selection_background = "#223249";
    # selection_foreground = "#cdcecf";
    # url_color = "#81b29a";
    # cursor = "#cdcecf";
    #
    # # Tabs
    # active_tab_background = "#719cd6";
    # active_tab_foreground = "#131a24";
    # inactive_tab_background = "#223249";
    # inactive_tab_foreground = "#526176";
    #
    # # normal
    # color0 = "#393b44";
    # color1 = "#c94f6d";
    # color2 = "#81b29a";
    # color3 = "#dbc074";
    # color4 = "#719cd6";
    # color5 = "#9d79d6";
    # color6 = "#63cdcf";
    # color7 = "#dfdfe0";
    #
    # # bright
    # color8 = "#575860";
    # color9 = "#d16983";
    # color10 = "#8ebaa4";
    # color11 = "#e0c989";
    # color12 = "#86abdc";
    # color13 = "#baa1e2";
    # color14 = "#7ad4d6";
    # color15 = "#e4e4e5";
    #
    # # extended colors
    # color16 = "#f4a261";
    # color17 = "#d67ad2";
  };
}

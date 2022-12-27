{ pkgs ? import <nixpkgs> { } }:
let
  helpers = pkgs.callPackage ./helpers.nix { };
  colorscheme = builtins.readFile ./kitty/moonfly.conf;
in with helpers; {
  enable = true;
  extraConfig = colorscheme;
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

    window_padding_width = "12.0";
    hide_window_decorations = "yes";
  };
}

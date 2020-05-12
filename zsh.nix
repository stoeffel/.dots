{ pkgs ? import <nixpkgs> { } }:
let plugins = import ./zsh/plugins.nix { inherit pkgs; };
in {
  enable = true;
  initExtra = ''
    fd() {
        [ $# -gt 0 ] && fasd_cd -d "$*" && return
        local dir
        dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "''${dir}" || return 1
    }

    autoload -U edit-command-line
    export PATH="$PATH:/usr/local/bin"
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:$HOME/.cabal/bin"
    export BAT_THEME="OneHalfDark"
    export LANG=en_US.UTF-8
    export EDITOR=nvim
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
    . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
  '';
  dotDir = ".config/zsh";
  oh-my-zsh = {
    enable = true;
    plugins = plugins.oh-my-zsh;
  };
  plugins = plugins.extras;
  shellAliases = import ./zsh/alias.nix { };
}

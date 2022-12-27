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

    _preexec() {
      _last_command="$1"
      _start_time="$SECONDS"
    }

    _precmd() {
      if ((''${+_start_time})); then
        _elapsed_seconds=$((SECONDS - _start_time))
        if ((_elapsed_seconds > 10)); then
            msg="display notification \"finished after ''${_elapsed_seconds}s\" with title \"''${_last_command}\""
            osascript -e $msg
            unset _start_time
        fi
      fi
    }

    autoload -U add-zsh-hook
    add-zsh-hook preexec _preexec
    add-zsh-hook precmd _precmd

    autoload -U edit-command-line
    export PATH="$PATH:/usr/local/bin"
    export PATH="$PATH:$HOME/.cargo/bin"
    export PATH="$PATH:$HOME/.cabal/bin"
    export PATH="$PATH:/bin"
    export PATH="$PATH:/sbin"
    export PATH="$PATH:$HOME/.npm-global/bin"
    export PATH="$PATH:$HOME/.local/bin"
    export BAT_THEME="OneHalfDark"
    export LANG=en_US.UTF-8
    export EDITOR=nvim
    # . "$HOME/.nix-profile/etc/profile.d/nix.sh"
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

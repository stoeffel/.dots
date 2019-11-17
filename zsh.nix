{pkgs}:
let
  plugins = import ./zsh/plugins.nix { inherit pkgs; };
in
{ enable = true;
  initExtra = ''
    fd() {
        [ $# -gt 0 ] && fasd_cd -d "$*" && return
        local dir
        dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "''${dir}" || return 1
    }

    autoload -U edit-command-line
    export PATH="~/.cabal/bin:$PATH"
    eval "$(direnv hook zsh)"
  '';
  dotDir = ".config/zsh";
  oh-my-zsh = {
    enable = true;
    plugins = plugins.oh-my-zsh;
  };
  plugins = plugins.extras;
  shellAliases = import ./zsh/alias.nix {};
}

if not test -f ~/.config/fish/functions/fisher.fish
    echo "Installing fisherman for the first time"
    curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    fisher
end
# Rebound Ctrl behaves as Escape
# xcape -e 'Control_L=Control_L|Escape'


setenv EDITOR nvim

eval (direnv hook fish)

# Aliases
##########

alias v "nvim"

# NPM
alias nr "npm run "
alias ni "npm install "
alias np "npm publish "
alias nt "npm test"
alias nu "npm update"
alias ns "npm run-script "

# List
alias l "ls -lah"

set -U FZF_FIND_FILE_COMMAND "rg --files"
set -U FZF_LEGACY_KEYBINDINGS 0

# The ale vim plugin requires this.
if not set -q TMPDIR
    set -gx TMPDIR /tmp
end

function edit_command_buffer --description 'Edit the command buffer in an external editor'
    set -l f (mktemp)
    if set -q f[1]
        mv $f $f.fish
        set f $f.fish
    else
        # We should never execute this block but better to be paranoid.
        set f /tmp/fish.(echo %self).fish
        touch $f
    end

    set -l p (commandline -C)
    commandline -b >$f
    if set -q EDITOR
        eval $EDITOR $f
    else
        vim $f
    end

    commandline -r (cat $f)
    commandline -C $p
    command rm $f
end

function nix-shell --description 'Start a nix shell from fish'
    bash --init-file /etc/bashrc -ci 'nix-shell'
end

if status --is-interactive
    set -g fish_user_abbreviations

    # Git
    abbr -a g 'git'
    abbr -a a 'git add'
    abbr -a all 'git add .'
    abbr -a p 'git add -p'
    abbr -a c 'git commit'
    abbr -a co 'git checkout'
    abbr -a br 'git checkout -b'
    abbr -a s 'git status'
    abbr -a pull 'git pull --rebase'
    abbr -a push 'git push'
    abbr -a force 'git push --force-with-lease'

    # Elm
    abbr -a ei 'elm-package install'
    abbr -a em 'elm-make'
    abbr -a et 'elm-test'

    # scripts
    abbr -a st './script/elm-test'
    abbr -a sba './script/build-elm-assets.js'
    abbr -a sbc './script/build-elm-css.sh'
end


# PATHS
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
chruby ruby-2.3.4
source ~/.private-stuff

set -gx PATH ~/.local/bin $PATH
source ~/.private-stuff

test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish

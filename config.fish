# fish_vi_key_bindings
fish_default_key_bindings

# Rebound Ctrl behaves as Escape
# xcape -e 'Control_L=Control_L|Escape'

# Aliases
##########

alias v "nvim"

# Git
alias g "git"
alias ga "git add"
alias gaa "git add ."
alias gac "git commit -a"
alias gd "git difftool"
alias gs "git status"
alias gp "git push"
alias gl "git pull --rebase"

# NPM
alias nr "npm run "
alias ni "npm install "
alias np "npm publish "
alias nt "npm test"
alias nu "npm update"
alias ns "npm run-script "

# List
alias l "ls -lah"

set -U FZF_FIND_FILE_COMMAND "ag -l --ignore .git"
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
    commandline -b > $f
    if set -q EDITOR
        eval $EDITOR $f
    else
        vim $f
    end

    commandline -r (cat $f)
    commandline -C $p
    command rm $f
end

fisher

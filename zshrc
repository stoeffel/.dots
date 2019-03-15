source ~/.dots/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles  <<EOBUNDLES
  git
  pip
  command-not-found
  battery
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  djui/alias-tips
  mafredri/zsh-async
  fzf
  ytet5uy4/fzf-widgets
EOBUNDLES

# Tell Antigen that you're done.
antigen apply

export FZF_BASE=`which fzf`
export FZF_FIND_FILE_COMMAND="rg --files"

eval "$(direnv hook zsh)"

export EDITOR='nvim'

alias -g v="nvim"
alias -g l="ls -lah"

# Git
alias g="git"
alias a="git add"
alias all="git add ."
alias p="git add -p"
alias c="git commit"
alias co="git checkout"
alias br="git checkout -b"
alias s="git status"
alias pull="git pull --rebase"
alias push="git push"
alias force="git push --force-with-lease"

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source ~/.dots/zsh/statusline.zsh
source ~/.dots/zsh/fzf.zsh
chruby $(cat .ruby-version)

export PATH=~/.local/bin:$PATH

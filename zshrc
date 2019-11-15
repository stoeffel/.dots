source ~/.dots/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles  <<EOBUNDLES
  git
  pip
  autojump
  command-not-found
  fasd
  battery
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  djui/alias-tips
  mafredri/zsh-async
  fzf
  ytet5uy4/fzf-widgets
  changyuheng/zsh-interactive-cd
EOBUNDLES

# Tell Antigen that you're done.
antigen apply

export FZF_BASE=`which fzf`
export FZF_FIND_FILE_COMMAND="rg --files"

eval "$(direnv hook zsh)"

export EDITOR='nvim'
alias -g v="nvim"
alias -g l="ls -lah"
alias tmux="tmux -u"

# Git
alias g="git"
alias a="git add"
alias all="git add ."
alias p="git add -p"
alias c="git commit"
alias ca="git commit --ammend"
alias ammend="git commit --ammend"
alias co="git checkout"
alias com="git checkout master"
alias br="git checkout -b"
alias s="git status"
alias pull="git pull --rebase"
alias pull="git pull --rebase"
alias push="git push"
alias force="git push --force-with-lease"
alias yoda="force"

alias cat="bat"

function gid () {
  ghcid --allow-eval "--command=stack ghci $1"
}

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

source /usr/local/opt/chruby/share/chruby/chruby.sh
source ~/.dots/zsh/statusline.zsh
source ~/.dots/zsh/fzf.zsh
if [[ -f ".ruby-version" ]]; then
  chruby $(cat .ruby-version)
fi

export PATH=~/.local/bin:$PATH
. /Users/stoeffel/.nix-profile/etc/profile.d/nix.sh

export PATH="/usr/local/opt/node@10/bin:$PATH"
export PATH="~/.cabal/bin:$PATH"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

## heavily borrowed from https://github.com/joseluisq/gitnow
function g -d "`git`"
  git $argv
end

function state -d "`git`"
  git status
end

function add -d "`git add`"
  git add $argv
end

function all -d "`git add -A`"
  git add -A
end

function patch -d "`git add -p`"
  git add -p
end

function commit -d "`git commit`"
  git commit $argv
end
#
# Git push with --set-upstream
# Shortcut inspired from https://github.com/jamiew/git-friendly
function push -d "git push"
  set -l bran (__helper_current_branch_name)
  set -l orig (__helper_current_remote)
  set -l comi (__helper_current_commit_short)
  set -l opts $argv

  if test (count $argv) -eq 0
    set opts $orig $bran
  end

  set -l pushr (git push -u $opts 2>&1)

  if test $status -eq 0
    echo

    if echo $pushr | grep -q -E 'Everything up\-to\-date'
      echo "🍺 Git says everything is up-to-date!"
    else
      echo "🚀 Your remote refs ('$orig/$bran') was updated! ($comi)"
    end
  else
    echo
    echo "⚠ Ouch, push failed!"
    echo -e $pushr
  end

  echo
end

function branch -d "Get branch operations"
  git checkout -b $argv
end

function checkout -d "Get branch operations"
  set -l bran (__helper_current_branch_name)

  if test (count $argv) -eq 1
    set bran $argv[1]
  end

  git checkout $bran
end


# git pull --rebase
function pull -d "git pull"
  set -l r

  if test (__helper_is_git_repository)
    set r "--rebase"
  end

  eval (echo git pull $r (__helper_args $argv))
  echo

  set -l bran (__helper_current_branch_name)
  set -l commi (__helper_current_commit_short)

  echo
  echo "✨ Your local '$bran' branch is updated! ($commi)"
  echo
end

function __helper_current_branch_name -d "Get current branch name"
  git symbolic-ref --short HEAD ^/dev/null
end

function __helper_current_remote -d "Get current origin name"
  set -l branch_name (__helper_current_branch_name)
  git config "branch.$branch_name.remote"; or echo origin
end

function __helper_current_path -d "Get current git path repository"
  git rev-parse --show-toplevel ^ /dev/null
end

function __helper_is_git_repository -d "Checks if the current path is a git path"
  git rev-parse --git-dir ^ /dev/null
end

function __helper_current_commit_short -d "Get current commit in short format"
  git rev-parse --short HEAD ^ /dev/null
end

function __helper_args -d "Processing the git arguments"
  set -l len (count $argv)
  set -l bran (__helper_current_branch_name)
  set -l orig (__helper_current_remote)

  if set -q argv
    if test $len -gt 0
      set orig $argv[1]
    end

    if test $len -gt 1
      set bran $argv[2]
    end
  end

  echo -n $orig $bran
end

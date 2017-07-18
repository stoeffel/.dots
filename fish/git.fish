if not set -q cgitc_initialized2
  set -U cgitc_initialized2

  # Abbrs
  abbr g 'git'
  abbr c 'git commit'
  abbr co 'git checkout'
  abbr br 'git checkout -b'
  abbr s 'git status'
  abbr pull 'git pull --rebase'
  abbr push 'git push'
end

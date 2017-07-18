if not set -q cgitc_initialized1
  set -U cgitc_initialized1

  # Abbrs
  abbr g 'git'
  abbr a 'git add'
  abbr all 'git add .'
  abbr p 'git add -p'
  abbr c 'git commit'
  abbr co 'git checkout'
  abbr br 'git checkout -b'
  abbr s 'git status'
  abbr pull 'git pull --rebase'
  abbr push 'git push'
end

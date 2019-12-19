{ }: {
  a = "git add";
  all = "git add .";
  ammend = "git commit --ammend";
  br = "git checkout -b";
  c = "git commit";
  ca = "git commit --ammend";
  cat = "bat";
  co = "git checkout";
  com = "git checkout master";
  force = "git push --force-with-lease";
  g = "git";
  l = "ls -lah";
  p = "git add -p";
  pull = "git pull --rebase";
  push = "git push";
  root = "cd $(git rev-parse --show-toplevel)";
  s = "git status";
  tmux = "tmux -u";
  t = "tmux -u";
  v = "nvim";
  yoda = "force";
}

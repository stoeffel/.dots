{ }: {
  l = "ls -lah";
  g = "tmux new-window 'lazygit;'";
  mux = "tmuxinator";
  root = "cd $(git rev-parse --show-toplevel)";
  t = "tmux -u";
  tmux = "tmux -u";
  v = "nvim";
  yoda = "force";
}

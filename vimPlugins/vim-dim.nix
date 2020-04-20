{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-dim";
  src = pkgs.fetchFromGitHub {
    owner = "jeffkreeftmeijer";
    repo = "vim-dim";
    rev = "00d1b3beacf22cf061b95261d7afbba461701826";
    sha256 = "13x3bx1dv8ivfvjlzaj7c8386ps93a2y7h56viai1xnqhbvjjvqy";
  };
}

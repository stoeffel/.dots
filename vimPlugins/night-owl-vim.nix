{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "night-owl-vim";
  src = pkgs.fetchFromGitHub {
    owner = "haishanh";
    repo = "night-owl.vim";
    rev = "18b6261656e6909ea93026de7eecdbe68686c3a9";
    sha256 = "0s823byr3z7s4z5jyva6rdi07cn96n8bvhbk363pdf89hr4xk2j5";
  };
}

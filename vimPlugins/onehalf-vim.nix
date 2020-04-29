{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "onehalf-vim";
  src = pkgs.fetchFromGitHub {
    owner = "sonph";
    repo = "onehalf";
    rev = "c0f08a297e69bc2826f748949e7ce4f0532797ee";
    sha256 = "0lg5bn5wa5mi7ldghnfwgkiprzs11is2pgsxc9a79wd7skr00smp";
  } + "/vim";
}

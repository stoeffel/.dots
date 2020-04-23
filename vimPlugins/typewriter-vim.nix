{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "typewriter-vim";
  src = pkgs.fetchFromGitHub {
    owner = "logico";
    repo = "typewriter-vim";
    rev = "62ba5b21415c91fa8fc683f3afd41d1657422f90";
    sha256 = "1z3y9kglig7i9ffdlzxmwhz0z89ymh4gfs2n4dlv3f61gxr1jlyn";
  };
}

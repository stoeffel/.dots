{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  name = "presenting-vim";
  src = pkgs.fetchFromGitHub {
    owner = "sotte";
    repo = "presenting.vim";
    rev = "9fb8ccc626cda329c08a35c1df8deff67768a537";
    sha256 = "1098gps6vnmvvljcqbsx2a5z2syzan30dl95x7pfbs6q1hskj5k7";
  };
}

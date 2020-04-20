{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "vim-noctu";
  src = pkgs.fetchFromGitHub {
    owner = "noahfrederick";
    repo = "vim-noctu";
    rev = "de2ff9855bccd72cd9ff3082bc89e4a4f36ea4fe";
    sha256 = "14z1mwmvq0crvljsk6x29bxxhbavbjsggjr68f6aiz3635yih8vy";
  };
}

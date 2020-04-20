{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "fogbell";
  src = pkgs.fetchFromGitHub {
    owner = "jaredgorski";
    repo = "fogbell.vim";
    rev = "b404c293a731ad7376fcddb07e01b49b9b351008";
    sha256 = "0mi33pa3m2h0k8ws7dd9d5r85mbhg0hisinrhzvh8g723yngp834";
  };
}

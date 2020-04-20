{ pkgs }:

pkgs.vimUtils.buildVimPlugin {
  name = "ayu-vim";
  src = pkgs.fetchFromGitHub {
    owner = "ayu-theme";
    repo = "ayu-vim";
    rev = "9dab20b38335ed06738f251e92e3817182063759";
    sha256 = "0m914bnrnv7gy49qzfdp1zl3a1h7zpicvh2xqdfqhp7h96psxwmx";
  };
}

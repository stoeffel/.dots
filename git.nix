{ pkgs ? import <nixpkgs> { } }:
let helpers = pkgs.callPackage ./helpers.nix { };
in with helpers; {
  enable = true;
  userName = "Stoeffel";
  userEmail = "schtoeffel@gmail.com";
  aliases = {
    undo-commit = "reset --soft HEAD^";
    set-origin = ''
      !git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`
    '';
  };
  ignores = readFileLines ./git/ignore;
  lfs.enable = true;
  extraConfig = {
    color.diff = "auto";
    color.status = "auto";
    color.branch = "auto";
    github.user = "stoeffel";
    github.email = "schtoeffel@gmail.com";
    apply.whitespace = "nowarn";
    push.default = "current";
    hub.protocol = "https";
    rerere.enabled = "1";
    "filter \"media\"" = {
      required = "true";
      clean = "git media clean %f";
      smudge = "git media smudge %f";
    };
    "filter \"lfs\"" = {
      clean = "git-lfs clean -- %f";
      smudge = "git-lfs smudge -- %f";
      required = "true";
      process = "git-lfs filter-process";
    };
    credential.helper = "osxkeychain";
    diff.tool = "nvimdiff";
    merge.tool = "nvimdiff";
    "difftool \"nvimdiff\"" = { cmd = ''nvim -d "$LOCAL" "$REMOTE"''; };
  };
}

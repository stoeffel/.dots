{ pkgs ? import <nixpkgs> { } }: {
  enable = true;
  settings = {
    prompt_order = [
      "directory"
      "git_branch"
      "git_state"
      "git_status"
      "line_break"
      "character"
    ];
    directory = { style = "fg:246"; };
    character = {
      symbol = "λ";
      error_symbol = "✗";
      use_symbol_for_status = true;
      style_success = "fg:cyan";
      style_failure = "fg:purple";
    };
    git_branch = {
      style = "fg:244";
      symbol = "";
    };
    git_status = {
      prefix = "";
      suffix = "";
      style = "fg:241";
      stashed = "";
    };
  };
}
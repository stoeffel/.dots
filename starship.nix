{ pkgs ? import <nixpkgs> { } }: {
  enable = true;
  settings = {
    add_newline = false;
    format = pkgs.lib.concatStringsSep "\n" [
      "[┌───────────────────](green) $git_branch$git_state $git_status"
      "[│](green)$directory"
      "[└─](green) "
    ];
    directory = { style = "fg:246"; };
    character = {
      success_symbol = "λ";
      error_symbol = "✗";
      use_symbol_for_status = true;
      style_success = "fg:cyan";
      style_failure = "fg:purple";
    };
    git_branch = {
      style = "italic fg:244";
      symbol = "";
      format = "[$symbol $branch]($style)";
    };
    git_status = {
      style = "fg:241";
      format = "([$all_status$ahead_behind]($style))";
      conflicted = " ";
      ahead = " ";
      behind = " ";
      diverged = " ";
      up_to_date = " ";
      untracked = "﬒ ";
      stashed = "";
      modified = " ";
      staged = "[++($count)](green)";
      renamed = "凜 ";
      deleted = " ";
    };
    git_state = {
      format = "[($state( $progress_current of $progress_total))]($style) ";
      cherry_pick = "[🍒 PICKING](bold red)";
    };
  };
}

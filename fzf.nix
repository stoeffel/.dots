{ pkgs ? import <nixpkgs> { } }: {
  enable = true;
  defaultCommand = "rg --files";
}

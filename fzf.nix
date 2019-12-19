{ pkgs ? import <nixpkgs> { } }:
let similarity-sort = pkgs.callPackage ./similarity-sort { };
in {
  enable = true;
  defaultCommand = "rg --files | ${similarity-sort}/bin/similarity-sort";
}

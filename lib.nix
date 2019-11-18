{ pkgs ? import <nixpkgs> { } }:
with builtins;
with pkgs.lib; rec {
  readFileLines = compose [ (splitString "\n") readFile ];
  readJSON = compose [ fromJSON readFile ];
  compose = fs: pipe (reverseList fs);
  pipe = fs: x: if fs != [ ] then pipe (tail fs) ((head fs) x) else x;
  unlines = concatStringsSep "\n";
  makeCallPackage = allPkgs: path: overrides:
    let fn = import path;
    in fn ((intersectAttrs (functionArgs fn) allPkgs) // overrides);
}

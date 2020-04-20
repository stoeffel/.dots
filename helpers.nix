{ pkgs }:
with builtins;
with pkgs.lib;
let
  readFileLines = compose [ (splitString "\n") readFile ];
  readJSON = compose [ fromJSON readFile ];
  compose = fs: pipe (reverseList fs);
  pipe = fs: x: if fs != [ ] then pipe (tail fs) ((head fs) x) else x;
  unlines = concatStringsSep "\n";
in { inherit readFileLines readJSON compose pipe unlines; }

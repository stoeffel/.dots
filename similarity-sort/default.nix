{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "similarity-sort";
  buildInputs = [ pkgs.go ];
  src = ./.;

  buildPhase = ''
    env HOME=$(pwd) GOPATH=$(pwd) go build similarity-sort.go
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp similarity-sort $out/bin
  '';
}

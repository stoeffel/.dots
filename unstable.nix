let
  # This is a SHA from the NixOS/nixpkgs-channels repository. Find an update by
  # going to https://nixos.org/channels/ and finding the latest build of
  # `nixos-unstable`. It will link to a rev, which you should put here. Be
  # aware that if you put something newer/not exactly what Hydra built, you'll
  # have to compile EVERYTHING.
  rev = "f0efbe21f9ae1e17d1aca922708f1bdef605039d";

  # Generate this sha using the following command:
  # $ nix-prefetch-url --unpack --type sha256 https://github.com/NixOS/nixpkgs/archive/<rev>.tar.gz
  sha256 = "0d3xyihm9f7x43vbrs1hi2fxchqi7b5jrwvvc7swhjvva1cyax1n";
  pkgsPath = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = sha256;
  };
in import pkgsPath { }

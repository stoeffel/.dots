let
  # This is a SHA from the NixOS/nixpkgs-channels repository. Find an update by
  # going to https://nixos.org/channels/ and finding the latest build of
  # `nixos-unstable`. It will link to a rev, which you should put here. Be
  # aware that if you put something newer/not exactly what Hydra built, you'll
  # have to compile EVERYTHING.
  rev = "b2122214da8779a1aaf8e033867644e5efa63cc9";

  # Generate this sha using the following command:
  # $ nix-prefetch-url --unpack --type sha256 https://github.com/NixOS/nixpkgs/archive/<rev>.tar.gz
  sha256 = "0imjpkwv40x70pgl5k2fj2xzsxl44smh6wb4spy38y31shlm02aa";
  pkgsPath = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = sha256;
  };
in import pkgsPath { }

let
  # This is a SHA from the NixOS/nixpkgs-channels repository. Find an update by
  # going to https://nixos.org/channels/ and finding the latest build of
  # `nixos-unstable`. It will link to a rev, which you should put here. Be
  # aware that if you put something newer/not exactly what Hydra built, you'll
  # have to compile EVERYTHING.
  rev = "6ef4f522d63f22b40004319778761040d3197390";

  # Generate this sha using the following command:
  # $ nix-prefetch-url --unpack --type sha256 https://github.com/NixOS/nixpkgs/archive/<rev>.tar.gz
  sha256 = "0cz02l0mdjr5vnv0kfkiabdjc3mv26lva414ksaf3xpan3sp08s1";
  pkgsPath = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = sha256;
  };
in import pkgsPath { }

let
  # This is a SHA from the NixOS/nixpkgs-channels repository. Find an update by
  # going to https://nixos.org/channels/ and finding the latest build of
  # `nixos-unstable`. It will link to a rev, which you should put here. Be
  # aware that if you put something newer/not exactly what Hydra built, you'll
  # have to compile EVERYTHING.
  rev = "10100a97c8964e82b30f180fda41ade8e6f69e41";

  # Generate this sha using the following command:
  # $ nix-prefetch-url --unpack --type sha256 https://github.com/NixOS/nixpkgs/archive/<rev>.tar.gz
  sha256 = "011f36kr3c1ria7rag7px26bh73d1b0xpqadd149bysf4hg17rln";
  pkgsPath = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = sha256;
  };
in import pkgsPath { }

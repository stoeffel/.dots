# copy this to .config/nixpkgs/config.nix
{
  packageOverrides = pkgs: {
    nur-stoeffel = import (builtins.fetchTarball
      "https://github.com/stoeffel/nur-packages/archive/master.tar.gz") {
        inherit pkgs;
      };
  };
}

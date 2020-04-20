{ pkgs }:

{
  ayu-vim = pkgs.callPackage ./ayu-vim.nix { };
  presenting-vim = pkgs.callPackage ./presenting-vim.nix { };
  fogbell-vim = pkgs.callPackage ./fogbell-vim.nix { };
}

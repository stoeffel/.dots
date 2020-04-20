{ pkgs }:

{
  ayu-vim = pkgs.callPackage ./ayu-vim.nix { };
  presenting-vim = pkgs.callPackage ./presenting-vim.nix { };
  fogbell-vim = pkgs.callPackage ./fogbell-vim.nix { };
  night-owl-vim = pkgs.callPackage ./night-owl-vim.nix { };
  vim-dim = pkgs.callPackage ./vim-dim.nix { };
  vim-noctu = pkgs.callPackage ./vim-noctu.nix { };
}

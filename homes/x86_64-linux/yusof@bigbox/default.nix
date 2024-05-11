{ inputs, pkgs, system, lib, ... }:

{
  imports = [
    ./utility
    ./mime.nix
    ./nix.nix
    ./packages.nix
  ];

  programs.nix-index-database.comma.enable = true;

  home.stateVersion = "24.05";
}

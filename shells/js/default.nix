{ pkgs, inputs, ... }:
let
  yappkgs = inputs.yappkgs.packages.${pkgs.system};
in
pkgs.mkShell {
  packages = [
    yappkgs.bun
    pkgs.nodejs_latest # NodeJS runtime + NPM
    pkgs.nodePackages_latest.pnpm # PNPM package manager
  ];
}

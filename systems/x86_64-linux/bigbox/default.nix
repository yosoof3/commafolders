# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Hardware configuration
      ./hardware.nix
      # NVIDIA configuration
      ./nvidia.nix
      # Virtualization variant (so I can test dotfiles easier)
      ./vm.nix
      # Network optins
      ./network.nix
      # Sound/Audio configuration
      ./audio.nix
      # Desktop
      ./desktop
      # Users
      ./users
      # Services config
      ./services
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "24.05";
}


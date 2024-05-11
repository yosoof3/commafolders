{ config, pkgs, inputs, ... }:

{
  imports = [
    ./fonts.nix # Set-up font configurations
    ./hyprland.nix # Enable Hyprland
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
}

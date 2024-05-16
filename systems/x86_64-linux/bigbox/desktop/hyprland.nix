{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = rec {
    "XDG_CURRENT_DESKTOP" = "Hyprland";
    "XDG_SESSION_DESKTOP" = "Hyprland";
    "XDG_SESSION_TYPE" = "wayland";

    "QT_AUTO_SCREEN_SCALE_FACTOR" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";

    "GDK_BACKEND" = "wayland,x11";
    "SDL_VIDEODRIVER" = "wayland";
    "CLUTTERz_BACKEND" = "wayland";

    # Cursor is not rendering?
    "WLR_NO_HARDWARE_CURSORS" = "1";

    # Electron apps 😭
    "NIXOS_OZONE_WL" = "1";
  };
  security.polkit.enable = true;
}

{ pkgs, lib, ... }:

[
  "waybar"
  "${lib.getExe pkgs.wl-clip-persist} --clipboard both"
  "${lib.getExe pkgs.swww} init && ${lib.getExe pkgs.swww} img ${./wallpapers/wallpaper-catppuccin-dark.png}"
]

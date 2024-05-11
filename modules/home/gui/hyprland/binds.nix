{ pkgs, lib, ... }:
let
  mainMod = "SUPER";
  mainModS = "SUPER_SHIFT";
  mainModC = "SUPER_CTRL";
  launchMod = "ALT";
  launchModS = "ALT_SHIFT";
in
[
  # App launcher && other apps
  "${mainMod}, SUPER_L, exec, menu"
  "${launchMod}, T, exec, kitty"
  "${launchMod}, Q, exec, firefox"
  "${launchMod}, E, exec, smile"

  # Clipboard manager
  "${mainMod}, V, exec, ${lib.getExe pkgs.cliphist} list | ${lib.getExe pkgs.wofi} --dmenu | ${lib.getExe pkgs.cliphist} decode | ${lib.getExe' pkgs.wl-clipboard "wl-copy"}"

  # Screen Capturing
  ", Print, exec, screenshot-bind"
  "${mainMod}, Print, exec, screenshot-window-bind"
  "${mainModS}, S, exec, screenshot-quick-bind"

  # Workspace Keybinds
  "${mainModS}, d, movetoworkspace, +1"
  "${mainModS}, a, movetoworkspace, -1"
  "${mainMod}, d, workspace, +1"
  "${mainMod}, a, workspace, -1"

  # Move Focus keybinds
  "${mainModC}, a, movefocus, l"
  "${mainModC}, d, movefocus, r"
  "${mainModC}, s, movefocus, d"
  "${mainModC}, w, movefocus, u"

  # Window keybinds"
  "${mainMod}, F, togglefloating"
  "${mainMod}, W, killactive"
]

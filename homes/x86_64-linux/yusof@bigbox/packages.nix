{ pkgs, inputs, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  home.packages = with unstable;
    [
      whois
      obsidian
      inkscape
      icon-library
      fractal
      gimp
      krita
      piper
      protonvpn-gui
      (pkgs.prismlauncher.override { glfw = pkgs.glfw-wayland-minecraft; })
      monophony
      g4music
      amberol
      tor-browser
      newsflash
      whois
      ngrok
      nixfmt
      obs-studio
      libsForQt5.kdenlive
      yt-dlp
      blender
      fastfetch
    ];
}

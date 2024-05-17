{ lib
, pkgs
, inputs
, osConfig
, ...
}:
let
  cfg = osConfig.modules.style;
in
{
  xdg.enable = true;

  catppuccin = {
    enable = true;
    flavour = "mocha";
    accent = "rosewater";
  };

  # pointer / cursor theming
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Rosewater-Cursors";
    package = pkgs.catppuccin-cursors.mochaRosewater;
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };
}

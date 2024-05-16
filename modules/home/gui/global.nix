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
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };
}

{ pkgs, config, ... }:

{
  home.packages = with pkgs.gnome; [
    nautilus
    file-roller
  ] ++ [
    pkgs.xdg-desktop-portal-gnome
    pkgs.adw-gtk3
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark"; # default / prefer-dark

      # Define default fonts
      monospace-font-name = "JetBrainsMono Nerd Font 10";
      document-font-name = "Inter Display 11";
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Inter Variable";
      size = 11;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    theme = {
      name = "Catppuccin-Mocha-Compact-Rosewater-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "rosewater" ];
        size = "compact";
        tweaks = [ "float" ];
        variant = "mocha";
      };
    };
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}


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
      gtk-theme = "adw-gtk3-dark"; # adw-gtk3 / adw-gtk3-dark

      # Define default fonts
      monospace-font-name = "JetBrainsMono Nerd Font 10";
      document-font-name = "Cantarell 11";
    };
  };

  gtk = {
    enable = true;
    font = {
      name = "Cantarell";
      size = 11;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}


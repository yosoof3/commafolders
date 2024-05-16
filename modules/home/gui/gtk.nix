{ pkgs, inputs, config, ... }: {
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
    catppuccin = {
      enable = true;
      size = "standard";
      tweaks = [ "normal" "rimless" ];
    };
    font = {
      name = "Inter Variable";
      size = 11;
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
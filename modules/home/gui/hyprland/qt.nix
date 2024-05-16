{ pkgs, config, ... }:
let
  qtctConfig = (pkgs.formats.ini { }).generate "qtct.conf" {
    Appearance.icon_theme = "breeze-dark";
  };
in
{
  home.packages = with pkgs; [
    kdePackages.okular
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-admin
    kdePackages.kio-extras
    kdePackages.kio-zeroconf
    kdePackages.kio-extras-kf5
    libsForQt5.qtwayland
    qt6.qtwayland
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "kvantum";
      package = with pkgs; [
        qt6Packages.qtstyleplugin-kvantum
        libsForQt5.qtstyleplugin-kvantum
        kdePackages.breeze-icons
        # "Since Qt 5.1 SVG support has moved into a module." - ArchWiki
        kdePackages.qtsvg
        libsForQt5.qt5.qtsvg
      ];
    };
  };

  xdg.configFile = {
    "qt6ct/qt6ct.conf".source = qtctConfig;
    "qt5ct/qt5ct.conf".source = qtctConfig;

    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
      General.theme = "Catppuccin-Mocha-Rosewater";
    };

    "Kvantum/Catppuccin-Mocha-Rosewater".source = "${pkgs.catppuccin-kvantum.override {
      accent = "Rosewater";
      variant = "Mocha";
    }}/share/Kvantum/Catppuccin-Mocha-Rosewater";
  };

}

{ config, pkgs, inputs, ... }:

{
  fonts = {
    packages = [
      pkgs.inter
      pkgs.noto-fonts-cjk-sans
      pkgs.source-sans-pro
      pkgs.go-font
      pkgs.monaspace
      pkgs.cantarell-fonts
      (pkgs.nerdfonts.override { fonts = [ "Monaspace" "JetBrainsMono" ]; })
    ];
    fontDir.enable = true;
    fontconfig.defaultFonts = {
      sansSerif = [
        "Inter Variable"
        "Inter Variable Regular"
        "Inter"
        "Inter Regular"
        "Cantarell"
        "DejaVu Sans"
      ];
      monospace = [
        "JetBrainsMono Nerd Font Mono"
        "Monaspice Nerd Font"
        "Monaspace Neon Var"
        "Monaspace Neon Regular"
        "DejaVu Sans Mono"
      ];
    };
  };

  system.fsPackages = [ pkgs.bindfs ];
  fileSystems =
    let
      mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
      };
      aggregatedFonts = pkgs.buildEnv {
        name = "system-fonts";
        paths = config.fonts.packages;
        pathsToLink = [ "/share/fonts" ];
      };
    in
    {
      # Create an FHS mount to support flatpak host icons/fonts
      "/usr/share/icons" = mkRoSymBind (config.system.path + "/share/icons");
      "/usr/share/fonts" = mkRoSymBind (aggregatedFonts + "/share/fonts");
    };
}

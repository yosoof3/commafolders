{ inputs, pkgs, config, lib, ... }:

{
  home.file.".vscode-oss/argv.json" = {
    force = true;
    text = builtins.toJSON {
      password-store = "gnome-libsecret";
      enable-crash-reporter = false;
      enable-proposed-api = [ "jeanp413.open-remote-ssh" ];
    };
  };

  home.packages = with pkgs; [ nil nixpkgs-fmt ];

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    # https://github.com/nix-community/home-manager/issues/4394#issuecomment-1712909231
    mutableExtensionsDir = false;
    userSettings = import ./settings.nix { inherit lib pkgs; };
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      (lib.me.mkOpenVSXExt {
        publisher = "jeanp413";
        name = "open-remote-ssh";
        version = "0.0.45";
        sha256 = "1qc1qsahfx1nvznq4adplx63w5d94xhafngv76vnqjjbzhv991v2";
      })
    ] ++ pkgs.callPackage ./extensions.nix {
      extensions =
        (inputs.vscode-extensions.extensions.${pkgs.system}.forVSCodeVersion
          pkgs.vscode.version).vscode-marketplace;
    };
  };
}

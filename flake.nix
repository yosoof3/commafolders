{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils-plus.url = "github:fl42v/flake-utils-plus";
      };
    };

    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kittypkgs.url = "git+https://codeberg.org/caffeinatedcharlie/kittypkgs"; # thank you charlie :)

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    yappkgs.url = "github:yosoof3/yappkgs";

    nuenv.url = "github:DeterminateSystems/nuenv";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      # You must provide our flake inputs to Snowfall Lib.
      inherit inputs;
      channels-config = { allowUnfree = true; };

      # Tell snowfall to use files here
      src = ./.;

      # Declare snowfall namespace
      snowfall.namespace = "me";
      package-namespace = "me";
      namespace = "me";

      homes.users."yusof@bigbox".modules = with inputs; [
        nix-index-database.hmModules.nix-index
        arkenfox.hmModules.arkenfox
        hyprland.homeManagerModules.default
      ];
    };
}

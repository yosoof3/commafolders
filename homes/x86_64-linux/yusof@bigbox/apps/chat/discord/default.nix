{ pkgs, ... }: {
  home.packages = [
    ((pkgs.vesktop.override {
      withSystemVencord = false;
    }).overrideAttrs {
      version = "1.5.1-8eaa520";
      src = pkgs.fetchFromGitHub {
        owner = "Vencord";
        repo = "Vesktop";
        rev = "8eaa5206b98ce7029b6879cc2ce361c2ae5f6239";
        hash = "sha256-OyAGzlwwdEKBbJJ7h3glwx/THy2VvUn/kA/Df3arWQU=";
      };
    })
  ];

  xdg.configFile."vesktop/settings/quickCss.css".source = ./theme.css;
  xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
}

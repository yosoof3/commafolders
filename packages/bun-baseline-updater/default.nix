{ pkgs, inputs, ... }:
let
  nuenv = import inputs.nixpkgs {
    system = pkgs.system;
    overlays = [ inputs.nuenv.overlays.nuenv ];
  };
in
nuenv.nuenv.writeScriptBin {
  name = "bun-baseline-updater";
  script = ''
        def fetch [url: string] {
        let prefetched: string = (nix-prefetch-url $url);
        echo ($prefetched)
        return (nix hash convert --hash-algo sha256 --to sri $prefetched)
    }

    def main [v: string] {
        let version = $"v($v)";
        const files = [
            "bun-darwin-aarch64.zip",
            "bun-linux-aarch64.zip",
            "bun-darwin-x64-baseline.zip",
            "bun-linux-x64-baseline.zip"
        ]

        echo $version

        echo $"
        sources = {
          "aarch64-darwin" = pkgs.fetchurl {
            url = "https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.0)";
            hash = "(fetch $"https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.0)")";
          };
          "aarch64-linux" = pkgs.fetchurl {
            url = "https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.1)";
            hash = "(fetch $"https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.1)")";
          };
          "x86_64-darwin" = pkgs.fetchurl {
            url = "https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.2)";
            hash = "(fetch $"https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.2)")";
          };
          "x86_64-linux" = pkgs.fetchurl {
            url =
              "https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.3)";
            hash =
              "(fetch $"https://github.com/oven-sh/bun/releases/download/bun-($version)/($files.3)")";
          };
        };
        "
    }
  '';
}

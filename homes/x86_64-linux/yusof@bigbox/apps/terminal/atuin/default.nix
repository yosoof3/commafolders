{ inputs, pkgs, ... }:
{
  programs.atuin = {
    enable = true;
    package = pkgs.atuin;
    enableNushellIntegration = true;
    settings = {
      dialect = "us";
      style = "compact";
      show_preview = true;
      secrets_filter = true;
      common_prefix = [ "sudo" ];
    };
  };
}

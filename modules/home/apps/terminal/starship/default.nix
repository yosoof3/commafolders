{ ... }: {
  programs.starship = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      add_newline = true;

      shell = {
        disabled = false;
        nu_indicator = "";
      };

      os = {
        disabled = false;
        symbols.NixOS = "";
        symbols.Linux = "";
        format = "$symbol ";
      };
    };
  };
}

{ pkgs, inputs, ... }: {
  programs.chromium = {
    enable = true;
    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      "dhdgffkkebhmkfjojejmpbldmpobfkfo"
      "fmkadmapgofadopljbjfkapdkoienihi"
    ];
  };
}

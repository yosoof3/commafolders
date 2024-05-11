{ pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "yosoof3";
    userEmail = "boxicalcube@proton.me";
    attributes = [ "*.lockb binary diff=lockb" ];
    extraConfig = {
      core.editor = "code --wait";
      init.defaultBranch = "main";
      commit.gpgsign = true;
      user.signingkey = "~/.ssh/id_ed25519.pub";
      gpg.format = "ssh";
      diff.lockb = {
        textconv = lib.getExe pkgs.bun;
        binary = true;
      };
      credential = {
        credentialStore = "plaintext";
        helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
      };
    };
  };
}

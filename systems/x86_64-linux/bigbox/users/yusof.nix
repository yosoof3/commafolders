{ config, pkgs, inputs, ... }:

{
  # My user account
  users.users.yusof = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "video" "audio" "docker" "postgres" ];
    initialHashedPassword =
      "$y$j9T$pBM3tJ8wwwZHnXeH7OoVx/$APbAVhe3hA1kCJepfF3jHyoxcDDvjCc4IvKUnklCtrD";
    shell = pkgs.nushell;
  };
}

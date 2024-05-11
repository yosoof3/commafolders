{ pkgs, config, ... }:

let
  homedir = config.home.homeDirectory;

  menu = pkgs.writeShellScriptBin "menu" ''
    if pgrep wofi; then
    	pkill wofi
    else
    	wofi --show drun
    fi
  '';

  powermenu = pkgs.writeShellScriptBin "powermenu" ''
    if pgrep wlogout; then
    	pkill wlogout
    else
      ${pkgs.wlogout}/bin/wlogout
    fi
  '';

  screenshot = pkgs.writeShellApplication {
    name = "screenshot-bind";

    runtimeInputs = with pkgs; [ satty grim wl-clipboard ];

    text = ''
      grim - | satty --filename - --initial-tool="crop" --early-exit --copy-command="wl-copy"
    '';
  };

  screenshot-window = pkgs.writeShellApplication
    {
      name = "screenshot-window-bind";

      runtimeInputs = with pkgs; [ grim satty jq wl-clipboard ];

      text = ''
        # shellcheck disable=SC2046
        grim -g "$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == "$(hyprctl activewindow -j | jq -r '.workspace.id')\)""| jq -r ".at,.size" | jq -s "add" | jq '_nwise(4)' | jq -r '"\(.[0]),\(.[1]) \(.[2])x\(.[3])"'| slurp)" - | satty --filename - --early-exit --copy-command="wl-copy"
      '';
    };

  screenshot-quick = pkgs.writeShellApplication
    {
      name = "screenshot-quick-bind";

      runtimeInputs = with pkgs; [ grim slurp wl-clipboard ];

      text = ''
        grim -g "$(slurp - d)" - | wl-copy
      '';
    };
in
{
  home.packages = with pkgs;
    [ menu powermenu screenshot screenshot-window screenshot-quick ];
}

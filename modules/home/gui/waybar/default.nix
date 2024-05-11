{ inputs, pkgs, lib, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  home.file.".local/share/fonts/polycat.ttf".source = ./polycat.ttf;
  programs.waybar = {
    enable = true;
    package = unstable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        spacing = 0;
        height = 46;
        "font-1" = "polycat";
        # "margin-left" = 20;
        # "margin-right" = 20;
        modules-left = [ "custom/logo" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right =
          [ "custom/polycat" "network" "tray" "clock" "pulseaudio" "custom/power" ];
        "wlr/taskbar" = {
          format = "{icon}";
          "on-click" = "activate";
          "on-click-right" = "fullscreen";
          "icon-size" = 25;
          "tooltip-format" = "{title}";
        };
        "hyprland/window" = {
          "format" = "{title:30}";
          "max-length" = 30;
        };
        "hyprland/workspaces" = {
          "on-click" = "activate";
          format = "{icon}";
          "format-icons" = {
            "default" = "";
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "active" = "󱓻";
            "urgent" = "󱓻";
          };
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
          };
        };
        tray = { spacing = 16; };
        clock = {
          "tooltip-format" = "<tt>{calendar}</tt>";
          "format-alt" = "  {:%a, %d %b %Y}";
          format = "{:%a %d, %I:%M}";
        };
        pulseaudio = {
          format = "{icon}";
          "format-bluetooth" = "󰂰";
          nospacing = 1;
          "tooltip-format" = "Volume : {volume}%";
          "format-muted" = "󰝟";
          "format-icons" = {
            "headphone" = "";
            "default" = [ "󰖀" "󰕾" "" ];
          };
          "on-click" = "pamixer -t";
          "scroll-step" = 5;
        };
        "custom/logo" = {
          format = "   ";
          tooltip = false;
          on-click = "menu";
        };
        battery = {
          format = "{capacity}% {icon}";
          "format-icons" = {
            "charging" = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            "default" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
          "format-full" = "󰁹 ";
          interval = 10;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };
        "custom/power" = {
          format = "󰤆";
          tooltip = false;
          on-click = "powermenu";
        };
        backlight = {
          device = "nvidia_0";
          format = "{icon}";
          "format-icons" = [ " " " " "" "" "" "" "" "" "" ];
        };
        network = {
          format = "{icon}    {ifname}";
          format-wifi = "{icon}   {ifname}";
          "format-icons" = [
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          "format-disconnected" = "󰤮";
          on-click = "nm-connection-editor";
        };
        "custom/polycat" = {
          type = "custom/script";
          exec = "${lib.getExe inputs.kittypkgs.packages.${pkgs.system}.polycat}";
          tail = true;
        };
        cpu = {
          format = "  : {icon} ";
          "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };
        temperature = {
          format = " : {temperatureF}°F";
        };
      };
    };
    style = import ./style.nix;
  };
  home.packages = with pkgs; [ pamixer networkmanagerapplet ];
}

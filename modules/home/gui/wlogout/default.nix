{ pkgs, ... }:
let theme = import ../theme.nix;
in {

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "${pkgs.hyprlock}/bin/hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
            * {
              font-family: "${theme.font}";
              background-image: none;
      transition: 20ms;
            }

          window {
            background-color: rgba(12,12,12,0.5);
          }

          button {
      color: #${theme.colors.accent_fg_color};
             font-size:20px;

             background-repeat: no-repeat;
             background-position: center;
             background-size: 30%;

             border-style: solid;
             background-color: #${theme.colors.window_bg_color};
              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          }

      button:focus,
               button:active {
      color: #${theme.colors.accent_fg_color};
             background-color: #${theme.colors.window_bg_color};
      border: 3px solid #${theme.colors.accent_color};
               }

             /* 
                ----------------------------------------------------- 
                Buttons
                ----------------------------------------------------- 
              */

      #lock,#logout,#suspend,#hibernate,#shutdown,#reboot {
        margin: 10px;
        border-radius: ${theme.rounding}px;
      }

      #lock {
              background-image: image(url("icons/lock.png"));
      }

      #logout {
              background-image: image(url("icons/logout.png"));
      }

      #suspend {
              background-image: image(url("icons/suspend.png"));
      }

      #hibernate {
              background-image: image(url("icons/hibernate.png"));
      }

      #shutdown {
              background-image: image(url("icons/shutdown.png"));
      }

      #reboot {
              background-image: image(url("icons/reboot.png"));
      }
    '';
  };

  xdg.configFile."wlogout/icons" = {
    recursive = false;
    source = ./icons;
  };
}


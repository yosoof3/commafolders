let
  theme = import ../theme.nix;
in
''
  * {
    border: none;
    border-radius: 0;
    min-height: 0;
    color: ${theme.colors.rosewater};
    font-family: "${theme.font}";
    font-weight: 500;
  }

  window#waybar {
    transition-property: background-color;
    transition-duration: 0.5s;
    font-size: 14px;
    background-color: ${theme.colors.base};
    color: ${theme.colors.rosewater};
    border-top: ${theme.border-size}px solid ${theme.colors.mantle};
  }
 
  window#waybar.hidden {
    opacity: 0.4;
  }

  #window > * {
    font-family: "${theme.font}", sans-serif;
  }

  #window {
    padding: 6px 12px;
    background-color: ${theme.colors.base};
    transition: 0.2s;
    margin: 6px 3px;
    border-radius: 9px;
  }

  tooltip {
    border-radius: ${theme.rounding}px;
    padding: 15px;
    background-color: ${theme.colors.base};
    color: ${theme.colors.text};
  }

  tooltip label {
    padding: 5px;
    background-color: ${theme.colors.base};
    color: ${theme.colors.text};
  }

  /* Waybar Modules */

  .modules-left, .modules-center, .modules-right {
    border-radius: ${theme.rounding}px;
    padding: 0 15px;
  }

  #workspaces {
    background-color: rgba(0,0,0,0);
    border-radius: ${theme.rounding}px;
  }

  #workspaces button {
    all: initial;
    min-width: 0;
    box-shadow: inset 0 -3px transparent;
    padding: 6px 18px;
    margin: 7px 7px;
    border-radius: ${theme.rounding}px;
    background-color: ${theme.colors.mantle};
    color: ${theme.colors.text};
    transition: 0.2s;
  }

  #workspaces button.active {
    background-color: ${theme.colors.rosewater};
    color: ${theme.colors.base};
  }

  #workspaces button:hover {
    box-shadow: inherit;
    text-shadow: inherit;
    opacity: 0.3;
    background-color: ${theme.colors.crust};
  }

  #workspaces button.urgent {
    background-color: ${theme.colors.error_bg};
    color: ${theme.colors.rosewater};
  }

  #memory,
  #custom-power,
  #battery,
  #backlight,
  #pulseaudio,
  #network,
  #clock,
  #tray,
  #backlight{
    border-radius: 9px;
    margin: 6px 3px;
    padding: 6px 12px;
    background-color: ${theme.colors.mantle};
    color: ${theme.colors.text};
    transition: 0.3s;
  }

  #memory:hover,
  #custom-power:hover,
  #battery:hover,
  #backlight:hover,
  #pulseaudio:hover,
  #network:hover,
  #clock:hover,
  #tray:hover,
  #backlight:hover {
    background-color: ${theme.colors.crust};
  }

  #pulseaudio {
    padding-right: 20px;
  }

  #clock {
    background-color: rgba(0,0,0,0);
    transition: 0.3s;
  }

  #clock:hover {
    color: ${theme.colors.crust};
    background-color: ${theme.colors.rosewater};
  }

  #taskbar {
    border-radius: ${theme.rounding}px;
    padding: 5px 0px;
  }

  #taskbar button {
    border-radius: ${theme.rounding}px;
  }

  #taskbar button:nth-child(1) {
    margin-left: 10px;
  }

  #cpu #temperature {
    margin: 0 15px;
  }

  /* Custom Modules */

  #custom-polycat {
    font-family: polycat;
    font-size: 24px;
    margin: 6px 3px;
    padding: 6px 12px;
    color: ${theme.colors.crust};
    background-color: ${theme.colors.rosewater};
    border-radius: 9px;
    margin-right: 10px;
  }

  #custom-logo {
    padding-right: 7px;
    font-size: 15px;
    color: ${theme.colors.text};
    background-color: ${theme.colors.mantle};
    transition: 0.3s;
  }

  #custom-power {
    background-color: ${theme.colors.base};
    color: ${theme.colors.text};
  }
''

let
  theme = import ../theme.nix;
in
''
  * {
    border: none;
    border-radius: 0;
    min-height: 0;
    font-family: "${theme.font}";
    color: ${theme.colors.accent_fg_color};
    font-weight: 500;
  }

  window#waybar {
    transition-property: background-color;
    transition-duration: 0.5s;
    font-size: 14px;
    color: ${theme.colors.accent_fg_color};
    background-color: ${theme.colors.window_bg_color};
    border-top: ${theme.border-size}px solid ${theme.colors.headerbar_bg_color};
  }
 
  window#waybar.hidden {
    opacity: 0.4;
  }

  #window > * {
    font-family: "${theme.font}", sans-serif;
  }

  #window {
    padding: 6px 12px;
    background-color: ${theme.colors.window_bg_color};
    transition: 0.2s;
    margin: 6px 3px;
    border-radius: 9px;
  }

  tooltip {
    border-radius: ${theme.rounding}px;
    padding: 15px;
    background-color: ${theme.colors.window_bg_color};
    color: ${theme.colors.accent_fg_color};
  }

  tooltip label {
    padding: 5px;
    background-color: ${theme.colors.window_bg_color};
    color: ${theme.colors.accent_fg_color};
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
    background-color: ${theme.colors.headerbar_bg_color};
    color: ${theme.colors.headerbar_fg_color};
    transition: 0.2s;
  }

  #workspaces button.active {
    color: ${theme.colors.accent_fg_color};
    background-color: ${theme.colors.accent_bg_color};
  }

  #workspaces button:hover {
    box-shadow: inherit;
    text-shadow: inherit;
    opacity: 0.3;
    background-color: ${theme.colors.dialog_bg_color};
  }

  #workspaces button.urgent {
    background-color: ${theme.colors.warning_bg_color};
    color: ${theme.colors.warning_fg_color};
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
    background-color: ${theme.colors.headerbar_bg_color};
    color: ${theme.colors.headerbar_fg_color};
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
    background-color: ${theme.colors.card_bg_color};
  }

  #pulseaudio {
    padding-right: 20px;
  }

  #clock {
    background-color: rgba(0,0,0,0);
    transition: 0.3s;
  }

  #clock:hover {
    background-color: ${theme.colors.accent_bg_color}
  }

  #taskbar {
    border-radius: ${theme.rounding}px;
    padding: 5px 0px;
  }

  #taskbar button {
    border-radius: ${theme.rounding}
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
    background-color: ${theme.colors.accent_bg_color};
    border-radius: 9px;
    margin-right: 10px;
  }

  #custom-logo {
    padding-right: 7px;
    font-size: 15px;
    color: ${theme.colors.accent_fg_color};
    background-color: ${theme.colors.headerbar_bg_color};
    transition: 0.3s;
  }

  #custom-power {
    background-color: ${theme.colors.headerbar_bg_color};
    color: ${theme.colors.accent_fg_color};
  }
''

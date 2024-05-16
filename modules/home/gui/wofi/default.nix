{ config, ... }:
let theme = import ../theme.nix;
in {
  programs.wofi = {
    enable = true;

    settings = {
      allow_markup = true;
      width = 450;
      show = "drun";
      prompt = "Search for an app..";
      normal_window = true;
      layer = "top";
      term = "foot";
      height = "305px";
      orientation = "vertical";
      halign = "fill";
      line_wrap = "off";
      dynamic_lines = false;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_search = false;
      parse_search = false;
      insensitive = true;
      hide_scroll = true;
      no_actions = true;
      sort_order = "default";
      gtk_dark = true;
      filter_rate = 100;
      key_expand = "Tab";
      key_exit = "Escape";
    };

    style = ''
      /** ********** Fonts ********** **/

      * {
        font-family: "${theme.font}";
        font-weight: 500;
        font-size: 15px;
      }

      #window {
        background-color: ${theme.colors.base};
        color: ${theme.colors.rosewater};
        border-radius: ${theme.rounding}px;
      }

      #outer-box {
        padding: 20px;
      }

      #input {
        background-color: ${theme.colors.base};
        padding: 8px 12px;
        border-radius: ${theme.rounding}px;
      }

      #scroll {
        margin-top: 20px;
      }

      #inner-box {}

      #img {
        padding-right: 8px;
      }

      #text {
        transition: 0.3s;
        color: #${theme.colors.rosewater};
      }

      #text:selected {
        color: black;
      }

      #entry {
        padding: 3px;
        transition: 0.3s;
      }

      #entry:selected {
        background-color: ${theme.colors.rosewater};
        padding-left: 35px;
        text-align: center;
      }

      #unselected {}

      #selected {}

      #input,
      #entry:selected {
        border-radius: ${theme.rounding}px;
      }
    '';
  };
}

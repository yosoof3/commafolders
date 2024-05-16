{ ... }: {
  # programs.kitty = {
  #   enable = true;
  #   settings = {
  #     background_opacity = "0.7";
  #     remember_window_size = true;
  #     window_logo_path = "none";
  #     cursor_shape = "beam";
  #     background = "#1d1d1d";
  #     foreground = "#deddda";
  #     selection_background = "#303030";
  #     selection_foreground = "#c0bfbc";
  #     url_color = "#1a5fb4";
  #     cursor = "#deddda";
  #     cursor_text_color = "#1d1d1d";
  #     active_border_color = "#4f4f4f";
  #     inactive_border_color = "#282828";
  #     bell_border_color = "#ed333b";
  #     visual_bell_color = "none";
  #     active_tab_background = "#242424";
  #     active_tab_foreground = "#fcfcfc";
  #     inactive_tab_background = "#303030";
  #     inactive_tab_foreground = "#b0afac";
  #     tab_bar_background = "none";
  #     tab_bar_margin_color = "none";

  #     # Colors
  #     color0 = "#1d1d1d";
  #     color1 = "#ed333b";
  #     color2 = "#57e389";
  #     color3 = "#ff7800";
  #     color4 = "#62a0ea";
  #     color5 = "#9141ac";
  #     color6 = "#5bc8af";
  #     color7 = "#deddda";
  #     color8 = "#9a9996";
  #     color9 = "#f66151";
  #     color10 = "#8ff0a4";
  #     color11 = "#ffa348";
  #     color12 = "#99c1f1";
  #     color13 = "#dc8add";
  #     color14 = "#93ddc2";
  #     color15 = "#f6f5f4";
  #   };
  #   font = {
  #     name = "JetBrainsMono NF";
  #     size = 11;
  #   };
  # };

  programs.foot = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NF:size=11";
        font-bold = "JetBrainsMono NF:style=ExtraBold:size=11";
        font-italic = "JetBrainsMono NF:style=Italic:size=11";
        font-size = "11";
      };

      cursor = {
        style = "beam";
        beam-thickness = 1.5;
        underline-thickness = 2.3;
      };

      colors.alpha = 0.5;
    };
  };
}

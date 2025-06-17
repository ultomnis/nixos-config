{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.btop;

in
{
  # Resource monitor
  programs.btop = {
    inherit (cfg) enable;

    settings = {
      color_theme = "TTY";
      theme_background = false;
      rounded_corners = false;
      vim_keys = true;
    };
  };
}

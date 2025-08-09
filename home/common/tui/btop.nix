{ config, ... }:

let
  cfg = config.luminosity.home.tui.btop;

in
{
  # Resource monitor
  programs.btop = {
    inherit (cfg) enable;

    settings = {
      rounded_corners = false;
      vim_keys = true;
    };
  };
}

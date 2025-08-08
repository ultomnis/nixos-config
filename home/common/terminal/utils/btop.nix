{ config, ... }:

let
  cfg = config.luminosity.home.programs.terminal.btop;

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

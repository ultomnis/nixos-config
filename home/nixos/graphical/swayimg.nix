{ config, ... }:

let
  cfg = config.luminosity.home.programs.graphical.swayimg;

in
{
  # Image viewer
  programs.swayimg = {
    inherit (cfg) enable;

    settings = {
      info = {
        show = "no";
      };
    };
  };
}

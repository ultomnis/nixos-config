{ config, ... }:

let
  cfg = config.luminosity.home.programs.graphical.zathura;

in
{
  # Document viewer
  programs.zathura = {
    inherit (cfg) enable;

    options = {
      recolor = true;
      recolor-keephue = true;
      recolor-reverse-video = true;
    };
  };
}

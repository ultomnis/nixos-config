{ config, ... }:

let
  cfg = config.luminosity.home.programs.graphical.obs-studio;

in
{
  # Screencasting and streaming program
  programs.obs-studio = {
    inherit (cfg) enable;
  };
}

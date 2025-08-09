{ config, ... }:

let
  cfg = config.luminosity.home.programs.gui.obs-studio;

in
{
  # Screencasting and streaming program
  programs.obs-studio = {
    inherit (cfg) enable;
  };
}

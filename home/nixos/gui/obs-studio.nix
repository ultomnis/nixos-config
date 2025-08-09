{ config, ... }:

let
  cfg = config.luminosity.home.gui.obs-studio;

in
{
  # Screencasting and streaming program
  programs.obs-studio = {
    inherit (cfg) enable;
  };
}

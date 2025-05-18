{ config, lib, ... }:

let
  cfg = config.luminosity.home.programs.graphical.obs-studio;

in
{
  config = lib.mkIf cfg.enable {
    # Screencasting and streaming program
    programs.obs-studio.enable = true;
  };
}

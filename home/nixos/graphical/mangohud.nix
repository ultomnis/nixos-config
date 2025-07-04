{ config, ... }:

let
  cfg = config.luminosity.home.programs.graphical.mangohud;

in
{
  # Overlay for monitoring system performance
  programs.mangohud = {
    inherit (cfg) enable;

    settings = {
      cpu_temp = true;
      gpu_temp = true;
    };
  };
}

{ config, ... }:

let
  cfg = config.luminosity.home.gui.mangohud;

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

  stylix.targets.mangohud = {
    inherit (cfg) enable;
  };
}

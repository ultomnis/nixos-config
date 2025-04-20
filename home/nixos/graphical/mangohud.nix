{ config, lib, ... }:

let
  cfg = config.luminosity.programs.graphical.mangohud;

in
{
  config = lib.mkIf cfg.enable {
    # Overlay for monitoring system performance
    programs.mangohud = {
      enable = true;

      settings = {
        cpu_temp = true;
        gpu_temp = true;
      };
    };
  };
}

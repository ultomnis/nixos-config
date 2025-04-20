{ config, lib, ... }:

let
  cfg = config.luminosity.programs.graphical.wlsunset;

in
{
  config = lib.mkIf cfg.enable {
    # Gamma adjustments
    services.wlsunset = {
      enable = true;

      sunrise = "07:00";
      sunset = "19:00";

      temperature = {
        day = 6500;
        night = 3400;
      };
    };
  };
}

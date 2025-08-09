{ config, ... }:

let
  cfg = config.luminosity.home.minimal.gammastep;

in
{
  # Adjust the color temperature of your screen
  services.gammastep = {
    inherit (cfg) enable;
    provider = "geoclue2";

    settings = {
      general = {
        adjustment-method = "wayland";
        fade = 1;
      };
    };

    temperature = {
      day = 6000;
      night = 3500;
    };
  };
}

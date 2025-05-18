{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.gammastep;

in
{
  config = lib.mkIf cfg.enable {
    # Adjust the color temperature of your screen
    services.gammastep = {
      enable = true;
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
  };
}

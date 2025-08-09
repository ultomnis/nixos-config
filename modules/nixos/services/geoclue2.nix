{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.geoclue2;

in
{
  # Geolocation service
  services.geoclue2 = {
    inherit (cfg) enable;

    appConfig = {
      gammastep = {
        isAllowed = true;
        isSystem = false;
      };
    };
  };
}

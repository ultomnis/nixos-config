{ config, ... }:

let
  cfg = config.luminosity.modules.services.geoclue2;

in
{
  # Geolocation service
  services.geoclue2 = {
    inherit (cfg) enable;
  };
}

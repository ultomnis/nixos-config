{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.geoclue2;

in
{
  config = lib.mkIf cfg.enable {
    # Geolocation service
    services.geoclue2 = {
      enable = true;

      appConfig = {
        gammastep = {
          isAllowed = true;
          isSystem = false;
        };
      };
    };
  };
}

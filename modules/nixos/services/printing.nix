{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.printing;

in
{
  config = lib.mkIf cfg.enable {
    services = {
      # Local print service
      printing = {
        enable = true;
        stateless = true;
      };

      # Enable autodiscovery of network printers
      avahi = {
        enable = true;
        nssmdns4 = true;
      };
    };
  };
}

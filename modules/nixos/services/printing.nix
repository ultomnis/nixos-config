{ config, ... }:

let
  cfg = config.luminosity.system.services.printing;

in
{
  # Local print service
  services.printing = {
    inherit (cfg) enable;
    stateless = true;
  };
}

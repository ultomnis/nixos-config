{ config, ... }:

let
  cfg = config.luminosity.modules.services.printing;

in
{
  # Local print service
  services.printing = {
    inherit (cfg) enable;
    stateless = true;
  };
}

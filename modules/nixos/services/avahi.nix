{ config, ... }:

let
  cfg = config.luminosity.modules.services.avahi;

in
{
  # Zeroconf implementation
  services.avahi = {
    inherit (cfg) enable;
    nssmdns4 = true;
  };
}

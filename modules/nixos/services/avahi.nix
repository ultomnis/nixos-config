{ config, ... }:

let
  cfg = config.luminosity.system.services.avahi;

in
{
  # Zeroconf implementation
  services.avahi = {
    inherit (cfg) enable;
    nssmdns4 = true;
  };
}

{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.avahi;

in
{
  # Zeroconf implementation
  services.avahi = {
    inherit (cfg) enable;
    nssmdns4 = true;
  };
}

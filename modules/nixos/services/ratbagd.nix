{ config, ... }:

let
  cfg = config.luminosity.system.services.ratbagd;

in
{
  # Configure input devices
  services.ratbagd = {
    inherit (cfg) enable;
  };
}

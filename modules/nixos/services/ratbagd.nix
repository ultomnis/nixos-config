{ config, ... }:

let
  cfg = config.luminosity.modules.services.ratbagd;

in
{
  # Configure input devices
  services.ratbagd = {
    inherit (cfg) enable;
  };
}

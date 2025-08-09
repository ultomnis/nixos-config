{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.ratbagd;

in
{
  # Configure input devices
  services.ratbagd = {
    inherit (cfg) enable;
  };
}

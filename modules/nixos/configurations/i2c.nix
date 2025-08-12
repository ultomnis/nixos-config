{ config, ... }:

let
  cfg = config.luminosity.modules.configurations.i2c;

in
{
  # Support i2c devices
  hardware.i2c = {
    inherit (cfg) enable;
  };
}

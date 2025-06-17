{ config, ... }:

let
  cfg = config.luminosity.system.services.bluetooth;

in
{
  hardware.bluetooth = {
    inherit (cfg) enable;

    settings = {
      General = {
        FastConnectable = true;
      };
    };
  };
}

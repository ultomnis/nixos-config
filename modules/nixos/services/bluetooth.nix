{ config, ... }:

let
  cfg = config.luminosity.modules.services.bluetooth;

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

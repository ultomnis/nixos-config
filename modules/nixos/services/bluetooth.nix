{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.bluetooth;

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

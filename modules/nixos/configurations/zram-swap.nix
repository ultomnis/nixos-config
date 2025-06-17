{ config, ... }:

let
  cfg = config.luminosity.system.configurations.zramSwap;

in
{
  # zram swap space
  zramSwap = {
    inherit (cfg) enable;
  };
}

{ config, ... }:

let
  cfg = config.luminosity.modules.configurations.zramSwap;

in
{
  # zram swap space
  zramSwap = {
    inherit (cfg) enable;
  };
}

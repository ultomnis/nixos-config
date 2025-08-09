{ config, ... }:

let
  cfg = config.luminosity.modules.system.configurations.zramSwap;

in
{
  # zram swap space
  zramSwap = {
    inherit (cfg) enable;
  };
}

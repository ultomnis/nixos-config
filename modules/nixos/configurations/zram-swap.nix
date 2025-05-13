{ config, lib, ... }:

let
  cfg = config.luminosity.system.configurations.zramSwap;

in
{
  config = lib.mkIf cfg.enable {
    # zram swap space
    zramSwap.enable = true;
  };
}

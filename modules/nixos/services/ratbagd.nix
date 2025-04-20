{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.ratbagd;

in
{
  config = lib.mkIf cfg.enable {
    # Configure input devices
    services.ratbagd.enable = true;
  };
}

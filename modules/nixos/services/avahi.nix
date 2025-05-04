{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.avahi;

in
{
  config = lib.mkIf cfg.enable {
    # Zeroconf implementation
    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}

{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.rtkit;

in
{
  config = lib.mkIf cfg.enable {
    # Realtime policy and watchdog daemon
    security.rtkit.enable = true;
  };
}

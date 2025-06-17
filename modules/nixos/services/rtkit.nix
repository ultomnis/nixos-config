{ config, ... }:

let
  cfg = config.luminosity.system.services.rtkit;

in
{
  # Realtime policy and watchdog daemon
  security.rtkit = {
    inherit (cfg) enable;
  };
}

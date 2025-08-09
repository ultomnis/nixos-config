{ config, ... }:

let
  cfg = config.luminosity.modules.services.rtkit;

in
{
  # Realtime policy and watchdog daemon
  security.rtkit = {
    inherit (cfg) enable;
  };
}

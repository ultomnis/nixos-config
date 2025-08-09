{ config, ... }:

let
  cfg = config.luminosity.modules.system.services.rtkit;

in
{
  # Realtime policy and watchdog daemon
  security.rtkit = {
    inherit (cfg) enable;
  };
}

{ config, ... }:

let
  cfg = config.luminosity.home.minimal.mako;

in
{
  # Notification daemon
  services.mako = {
    inherit (cfg) enable;

    settings = {
      border-size = 2;
      default-timeout = 5000;
    };
  };
}

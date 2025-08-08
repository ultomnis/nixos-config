{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.mako;

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

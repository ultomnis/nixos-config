{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.mako;

in
{
  # Notification daemon
  services.mako = {
    inherit (cfg) enable;

    settings = {
      background-color = "#00000099";
      border-size = 0;
      default-timeout = 5000;
    };
  };
}

{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.mako;

in
{
  # Notification daemon
  services.mako = {
    inherit (cfg) enable;

    settings = {
      background-color = "#000000cc";
      border-size = 0;
      default-timeout = 5000;
    };
  };
}

{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.swaylock;

in
{
  # Wayland screen locker
  programs.swaylock = {
    inherit (cfg) enable;

    settings = {
      show-failed-attempts = true;
    };
  };
}

{ config, ... }:

let
  cfg = config.luminosity.home.minimal.swaylock;

in
{
  # Wayland screen locker
  programs.swaylock = {
    inherit (cfg) enable;

    settings = {
      show-failed-attempts = true;
    };
  };

  stylix.targets.swaylock = {
    inherit (cfg) enable;
  };
}

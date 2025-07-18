{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.darkman;

in
{
  # Dark-mode and light-mode transitions
  services.darkman = {
    inherit (cfg) enable;
  };
}

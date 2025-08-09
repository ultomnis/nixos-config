{ config, ... }:

let
  cfg = config.luminosity.home.minimal.darkman;

in
{
  # Dark-mode and light-mode transitions
  services.darkman = {
    inherit (cfg) enable;
  };
}

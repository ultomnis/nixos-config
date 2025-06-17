{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.polkit-gnome;

in
{
  # PolicyKit authentication agent
  services.polkit-gnome = {
    inherit (cfg) enable;
  };
}

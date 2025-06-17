{ config, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.gnome-keyring;

in
{
  # Secret Service provider
  services.gnome-keyring = {
    inherit (cfg) enable;
  };
}

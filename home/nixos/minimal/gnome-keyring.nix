{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.gnome-keyring;

in
{
  config = lib.mkIf cfg.enable {
    # Secret Service provider
    services.gnome-keyring.enable = true;
  };
}

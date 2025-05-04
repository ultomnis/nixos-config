{ config, lib, ... }:

let
  cfg = config.luminosity.system.services.gnome-keyring;

in
{
  config = lib.mkIf cfg.enable {
    # Secret Service provider
    services.gnome.gnome-keyring.enable = true;
  };
}

{ config, lib, ... }:

let
  cfg = config.luminosity.desktop.gnome-keyring;

in
{
  config = lib.mkIf cfg.enable {
    # Secret Service provider
    services.gnome-keyring.enable = true;
  };
}

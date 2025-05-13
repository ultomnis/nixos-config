{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.minimal.polkit-gnome;

in
{
  config = lib.mkIf cfg.enable {
    # PolicyKit authentication agent
    services.polkit-gnome.enable = true;
  };
}

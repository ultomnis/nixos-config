{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.cursors;

in
{
  home.pointerCursor = {
    package = lib.mkIf (cfg.package != null) cfg.package;
    name = lib.mkIf (cfg.name != null) cfg.name;
    size = 24;
    gtk.enable = true;
  };
}

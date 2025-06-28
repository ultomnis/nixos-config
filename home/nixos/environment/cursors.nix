{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.cursors;

in
{
  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      name = lib.mkIf (cfg.name != null) cfg.name;
      package = lib.mkIf (cfg.package != null) cfg.package;
      size = 24;
    };
  };
}

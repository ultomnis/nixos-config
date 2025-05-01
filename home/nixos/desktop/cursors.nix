{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.themes;

in
{
  config = lib.mkIf cfg.enable {
    # Cursor configuration
    home.pointerCursor = {
      package = cfg.cursorPackage;
      name = cfg.cursorName;
      size = 24;
      gtk.enable = true;
    };
  };
}

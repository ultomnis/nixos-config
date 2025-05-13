{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.themes;

in
{
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        package = cfg.package;
        name = cfg.name;
      };

      iconTheme = {
        package = cfg.iconPackage;
        name = cfg.iconName;
      };
    };

    home.pointerCursor = {
      package = cfg.cursorPackage;
      name = cfg.cursorName;
      size = 24;
      gtk.enable = true;
    };
  };
}

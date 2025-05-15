{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.themes;

in
{
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      theme = {
        package = lib.mkIf (cfg.package != null) cfg.package;
        name = lib.mkIf (cfg.name != null) cfg.name;
      };

      iconTheme = {
        package = lib.mkIf (cfg.iconPackage != null) cfg.iconPackage;
        name = lib.mkIf (cfg.iconName != null) cfg.iconName;
      };
    };

    home.pointerCursor = {
      package = lib.mkIf (cfg.cursorPackage != null) cfg.cursorPackage;
      name = lib.mkIf (cfg.cursorName != null) cfg.cursorName;
      size = 24;
      gtk.enable = true;
    };
  };
}

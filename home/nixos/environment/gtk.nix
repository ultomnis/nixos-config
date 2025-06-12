{ config, lib, ... }:

let
  cfg = config.luminosity.home.desktop.environment.gtk;

in
{
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;

      font = {
        name = lib.mkIf (cfg.font.name != null) cfg.font.name;
        size = lib.mkIf (cfg.font.size != null) cfg.font.size;
      };

      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };

      iconTheme = {
        package = lib.mkIf (cfg.icon.package != null) cfg.icon.package;
        name = lib.mkIf (cfg.icon.name != null) cfg.icon.name;
      };
    };
  };
}

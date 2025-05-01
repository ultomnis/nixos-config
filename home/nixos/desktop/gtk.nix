{ config, lib, ... }:

let
  inherit (config.luminosity.home.desktop.environment)
    fonts
    themes
    ;

in
{
  config = lib.mkIf (themes.enable || fonts.enable) {
    gtk = {
      enable = true;

      theme = lib.mkIf themes.enable {
        package = themes.package;
        name = themes.name;
      };

      iconTheme = lib.mkIf themes.enable {
        package = themes.iconPackage;
        name = themes.iconName;
      };

      font = lib.mkIf fonts.enable {
        name = fonts.propo;
        size = fonts.size;
      };
    };
  };
}

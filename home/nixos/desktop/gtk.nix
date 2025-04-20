{ config, lib, ... }:

let
  inherit (config.luminosity.desktop)
    fonts
    themes
    ;

in
{
  config = lib.mkMerge [
    (lib.mkIf (themes.enable) {
      gtk = {
        enable = true;

        theme = {
          package = themes.package;
          name = themes.name;
        };

        iconTheme = {
          package = themes.iconPackage;
          name = themes.iconName;
        };
      };
    })

    (lib.mkIf (fonts.enable) {
      gtk = {
        enable = true;

        font = {
          name = fonts.propo;
          size = fonts.size;
        };
      };
    })
  ];
}

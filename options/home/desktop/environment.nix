{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkOption
    mkPackageOption
    types
    ;

  mkEnvironmentOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.desktop.environment.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.home.desktop.environment = {
    dconf = mkEnvironmentOption "dconf" { };

    fonts = mkEnvironmentOption "font configuration" {
      package = mkPackageOption pkgs "font" {
        default = [
          "nerd-fonts"
          "hack"
        ];

        nullable = true;
      };

      regular = mkOption {
        type = types.nullOr types.str;
        default = "Hack Nerd Font";
        description = "Regular font name.";
      };

      mono = mkOption {
        type = types.nullOr types.str;
        default = "Hack Nerd Font Mono";
        description = "Monospace font name.";
      };

      propo = mkOption {
        type = types.nullOr types.str;
        default = "Hack Nerd Font Propo";
        description = "Proportional font name.";
      };

      size = mkOption {
        type = types.nullOr types.int;
        default = 12;
        description = "Font size.";
      };
    };

    themes = mkEnvironmentOption "theme configuration" {
      package = mkPackageOption pkgs "GTK theme" {
        default = "rose-pine-gtk-theme";
        nullable = true;
      };

      cursorPackage = mkPackageOption pkgs "cursor theme" {
        default = "bibata-cursors";
        nullable = true;
      };

      iconPackage = mkPackageOption pkgs "icon theme" {
        default = "papirus-icon-theme";
        nullable = true;
      };

      name = mkOption {
        type = types.nullOr types.str;
        default = "rose-pine";
        description = "Theme name.";
      };

      cursorName = mkOption {
        type = types.nullOr types.str;
        default = "Bibata-Modern-Ice";
        description = "Cursor theme name.";
      };

      iconName = mkOption {
        type = types.nullOr types.str;
        default = "Papirus";
        description = "Icon theme name.";
      };
    };
  };
}

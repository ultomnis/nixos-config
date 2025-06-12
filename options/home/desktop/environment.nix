{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkOption
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
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.home.desktop.environment = {
    dconf = mkEnvironmentOption "dconf" { };

    fonts = mkEnvironmentOption "font configuration" {
      extraPackages = mkOption {
        type = types.listOf types.package;
        default = [ ];
        description = "Extra font packages to install.";
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

    gtk = mkEnvironmentOption "GTK configuration" {
      font = {
        name = mkOption {
          type = types.nullOr types.str;
          default = config.luminosity.home.desktop.environment.fonts.propo;
          description = "Font for GTK.";
        };

        size = mkOption {
          type = types.nullOr types.int;
          default = config.luminosity.home.desktop.environment.fonts.size;
          description = "Font size for GTK.";
        };
      };

      icon = {
        package = mkOption {
          type = types.nullOr types.package;
          default = pkgs.papirus-icon-theme;
          description = "Icon theme package.";
        };

        name = mkOption {
          type = types.nullOr types.str;
          default = "Papirus";
          description = "Icon theme name.";
        };
      };
    };

    cursors = mkEnvironmentOption "Cursor configuration" {
      package = mkOption {
        type = types.nullOr types.package;
        default = pkgs.bibata-cursors;
        description = "Cursor theme package.";
      };

      name = mkOption {
        type = types.nullOr types.str;
        default = "Bibata-Modern-Ice";
        description = "Cursor theme name.";
      };
    };
  };
}

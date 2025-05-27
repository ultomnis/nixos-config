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
    // extraOptions;

in
{
  options.luminosity.home.desktop.environment = {
    fonts = mkEnvironmentOption "font configuration" { };

    stylix = mkEnvironmentOption "Stylix" {
      icons = mkEnvironmentOption "Icon configuration" {
        package = mkOption {
          type = types.nullOr types.package;
          default = pkgs.papirus-icon-theme;
          description = "Icon theme package.";
        };

        dark = mkOption {
          type = types.nullOr types.str;
          default = "Papirus-Dark";
          description = "Dark icon theme name.";
        };

        light = mkOption {
          type = types.nullOr types.str;
          default = "Papirus-Light";
          description = "Light icon theme name.";
        };
      };
    };
  };
}

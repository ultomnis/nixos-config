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
    fonts = mkEnvironmentOption "font configuration" { };

    stylix = mkEnvironmentOption "Stylix" {
      icons = {
        package = mkOption {
          type = types.package;
          default = pkgs.papirus-icon-theme;
          description = "Icon theme package.";
        };

        dark = mkOption {
          type = types.str;
          default = "Papirus-Dark";
          description = "Dark icon theme name.";
        };

        light = mkOption {
          type = types.str;
          default = "Papirus-Light";
          description = "Light icon theme name.";
        };
      };
    };
  };
}

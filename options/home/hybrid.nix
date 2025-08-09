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

  mkHybridOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.hybrid.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.hybrid = {
    cursor = {
      enable = mkHybridOption "Stylix cursor configuration";

      package = mkPackageOption pkgs "cursor" {
        default = [
          "bibata-cursors"
        ];
      };

      name = mkOption {
        type = types.str;
        default = "Bibata-Modern-Ice";
        description = "Cursor name.";
      };

      size = mkOption {
        type = types.ints.positive;
        default = 24;
        description = "Cursor size.";
      };
    };

    fonts.enable = mkHybridOption "font configuration";

    icons = {
      enable = mkHybridOption "Stylix icon configuration";

      package = mkPackageOption pkgs "icon" {
        default = [
          "papirus-icon-theme"
        ];
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
}

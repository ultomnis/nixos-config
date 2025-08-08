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
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.desktop.environment.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.desktop.environment = {
    cursor = {
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

    fonts.enable = mkEnvironmentOption "font configuration";

    icons = {
      enable = mkEnvironmentOption "Stylix home configuration";

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

    ssh-agent.enable = mkEnvironmentOption "SSH Agent";
  };
}

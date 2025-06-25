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
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.home.desktop.environment = {
    cursors = mkEnvironmentOption "cursor configuration" {
      name = mkOption {
        type = types.nullOr types.str;
        default = "Bibata-Modern-Ice";
        description = "Cursor theme name.";
      };

      package = mkPackageOption pkgs "cursor" {
        default = "bibata-cursors";
        nullable = true;
      };
    };

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

      extraPackages = mkOption {
        type = types.listOf types.package;
        default = [ ];
        description = "Extra font packages to install.";
      };
    };

    ssh-agent = mkEnvironmentOption "SSH Agent" { };
  };
}

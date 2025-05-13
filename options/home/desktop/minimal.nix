{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkMinimalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.desktop.minimal.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.home.desktop.minimal = {
    aerospace = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.desktop == "aerospace";
        description = "Whether to enable AeroSpace.";
      };
    };

    fuzzel = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.launcher == "fuzzel";
        description = "Whether to enable fuzzel.";
      };
    };

    mako = mkMinimalOption "mako" { };
    polkit-gnome = mkMinimalOption "Polkit GNOME" { };

    sway = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };
    };

    waybar = mkMinimalOption "Waybar" {
      menuCommand = mkOption {
        type = types.str;
        default = null;
        description = "Command to use when clicking menu";
      };
    };

    wlsunset = mkMinimalOption "wlsunset" { };
  };
}

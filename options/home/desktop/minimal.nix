{
  config,
  lib,
  osConfig ? null,
  ...
}:

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
        default =
          if (osConfig != null) then
            (osConfig.luminosity.selections.desktop == "aerospace")
          else
            (config.luminosity.selections.desktop == "aerospace");
        description = "Whether to enable AeroSpace.";
      };
    };

    fuzzel = {
      enable = mkOption {
        type = types.bool;
        default =
          if (osConfig != null) then
            (osConfig.luminosity.selections.launcher == "fuzzel")
          else
            (config.luminosity.selections.launcher == "fuzzel");
        description = "Whether to enable fuzzel.";
      };
    };

    gammastep = mkMinimalOption "Gammastep" { };
    gnome-keyring = mkMinimalOption "GNOME Keyring" { };
    mako = mkMinimalOption "mako" { };
    polkit-gnome = mkMinimalOption "Polkit GNOME" { };

    sway = {
      enable = mkOption {
        type = types.bool;
        default =
          if (osConfig != null) then
            (osConfig.luminosity.selections.desktop == "sway")
          else
            (config.luminosity.selections.desktop == "sway");
        description = "Whether to enable Sway.";
      };
    };

    waybar = mkMinimalOption "Waybar" {
      menuCommand = mkOption {
        type = types.nullOr types.str;
        default = null;
        description = "Command to use when clicking menu";
      };
    };
  };
}

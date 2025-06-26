{
  config,
  customLib,
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  customConfig = if (osConfig != null) then osConfig else config;

  mkMinimalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.desktop.minimal.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.home.desktop.minimal = {
    aerospace = {
      enable = mkOption {
        type = types.bool;
        default = customConfig.luminosity.selections.desktop == "aerospace";
        description = "Whether to enable AeroSpace.";
      };

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = customConfig.luminosity.selections.terminal;
        description = "Terminal for AeroSpace.";
      };
    };

    dconf = mkMinimalOption "dconf" { };
    fuzzel = mkMinimalOption "fuzzel" { };
    gammastep = mkMinimalOption "Gammastep" { };
    mako = mkMinimalOption "mako" { };
    polkit-kde-agent = mkMinimalOption "Polkit KDE Agent" { };
    qtct = mkMinimalOption "Qt Configuration Tool" { };

    sway = {
      enable = mkOption {
        type = types.bool;
        default = customConfig.luminosity.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };

      monitors = mkOption {
        inherit (selectionTypes.monitors) type;
        default = customConfig.luminosity.selections.monitors;
        description = "Sway monitor configuration.";
      };

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = customConfig.luminosity.selections.terminal;
        description = "Terminal for Sway.";
      };

      wallpaper = mkOption {
        type = types.nullOr types.path;
        default = customConfig.luminosity.selections.wallpaper;
        description = "Wallpaper for Sway.";
      };
    };

    swayidle = mkMinimalOption "Swayidle" { };

    swaylock = mkMinimalOption "Swaylock" {
      wallpaper = mkOption {
        type = types.nullOr types.path;
        default = customConfig.luminosity.selections.wallpaper;
        description = "Wallpaper for Swaylock.";
      };
    };
  };
}

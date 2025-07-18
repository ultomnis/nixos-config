{
  config,
  customLib,
  lib,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  mkMinimalOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.desktop.minimal.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.desktop.minimal = {
    aerospace = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.desktop == "aerospace";
        description = "Whether to enable AeroSpace.";
      };

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = config.luminosity.home.selections.terminal;
        description = "Terminal for AeroSpace.";
      };
    };

    darkman.enable = mkMinimalOption "darkman";
    fuzzel.enable = mkMinimalOption "fuzzel";
    gammastep.enable = mkMinimalOption "Gammastep";

    i3status-rust = {
      enable = mkMinimalOption "i3status-rust";

      battery = mkEnableOption "battery block for i3status-rust";

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = config.luminosity.home.selections.terminal;
        description = "Terminal for i3status-rust.";
      };
    };

    mako.enable = mkMinimalOption "mako";
    polkit-kde-agent.enable = mkMinimalOption "Polkit KDE Agent";

    sway = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.desktop == "sway";
        description = "Whether to enable Sway.";
      };

      bar = {
        font = {
          name = mkOption {
            type = types.nullOr types.str;
            default = config.luminosity.home.desktop.environment.fonts.propo;
            description = "Font for Swaybar.";
          };

          size = mkOption {
            type = types.nullOr types.int;
            default = config.luminosity.home.desktop.environment.fonts.size;
            description = "Font size for Swaybar.";
          };
        };
      };

      monitors = mkOption {
        inherit (selectionTypes.monitors) type;
        default = config.luminosity.home.selections.monitors;
        description = "Sway monitor configuration.";
      };

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = config.luminosity.home.selections.terminal;
        description = "Terminal for Sway.";
      };

      wallpaper = mkOption {
        type = types.nullOr types.path;
        default = config.luminosity.home.selections.wallpaper;
        description = "Wallpaper for Sway.";
      };
    };

    swayidle.enable = mkMinimalOption "Swayidle";

    swaylock = {
      enable = mkMinimalOption "Swaylock";

      wallpaper = mkOption {
        type = types.nullOr types.path;
        default = config.luminosity.home.selections.wallpaper;
        description = "Wallpaper for Swaylock.";
      };
    };

    xdg-desktop-portal.enable = mkMinimalOption "XDG Desktop Portal";
  };
}

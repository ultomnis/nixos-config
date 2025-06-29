{
  config,
  customLib,
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  customConfig = if (osConfig != null) then osConfig else config;

  mkMinimalOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.desktop.minimal.enable;
      description = "Whether to enable " + name + ".";
    };

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

    dconf.enable = mkMinimalOption "dconf";
    fuzzel.enable = mkMinimalOption "fuzzel";
    gammastep.enable = mkMinimalOption "Gammastep";

    i3status-rust = {
      enable = mkMinimalOption "i3status-rust";

      battery = mkEnableOption "Whether to enable battery block for i3status-rust.";

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = customConfig.luminosity.selections.terminal;
        description = "Terminal for i3status-rust.";
      };
    };

    mako.enable = mkMinimalOption "mako";
    polkit-kde-agent.enable = mkMinimalOption "Polkit KDE Agent";

    sway = {
      enable = mkOption {
        type = types.bool;
        default = customConfig.luminosity.selections.desktop == "sway";
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

    swayidle.enable = mkMinimalOption "Swayidle";

    swaylock = {
      enable = mkMinimalOption "Swaylock";

      wallpaper = mkOption {
        type = types.nullOr types.path;
        default = customConfig.luminosity.selections.wallpaper;
        description = "Wallpaper for Swaylock.";
      };
    };

    xdg-desktop-portal.enable = mkMinimalOption "XDG Desktop Portal";
  };
}

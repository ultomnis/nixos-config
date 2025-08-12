{
  config,
  customLib,
  lib,
  pkgs,
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
      default = config.luminosity.home.minimal.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.minimal = {
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

      keybinds = {
        brightnessDown = mkOption {
          type = types.str;
          default = "exec ${lib.getExe pkgs.brightnessctl} set 5%-";
          description = "Brightness down keybind for Sway.";
        };

        brightnessUp = mkOption {
          type = types.str;
          default = "exec ${lib.getExe pkgs.brightnessctl} set 5%+";
          description = "Brightness up keybind for Sway.";
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
    };

    swayidle.enable = mkMinimalOption "Swayidle";
    swaylock.enable = mkMinimalOption "Swaylock";
    xdg-desktop-portal.enable = mkMinimalOption "XDG Desktop Portal";
  };
}

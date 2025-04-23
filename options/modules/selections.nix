{ lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

in
{
  options.luminosity.selections = {
    desktop = mkOption {
      type = types.nullOr (
        types.enum [
          "aerospace"
          "sway"
        ]
      );

      default = null;
      description = "Desktop environment selection.";
    };

    editor = mkOption {
      type = types.nullOr (
        types.enum [
          "hx"
        ]
      );

      default = null;
      description = "Default text editor.";
    };

    gpu = mkOption {
      type = types.nullOr (
        types.enum [
          "amd"
        ]
      );

      default = null;
      description = "System GPU.";
    };

    launcher = mkOption {
      type = types.nullOr (
        types.enum [
          "fuzzel"
        ]
      );

      default = null;
      description = "Default application launcher.";
    };

    shell = mkOption {
      type = types.nullOr (
        types.enum [
          "fish"
        ]
      );

      default = null;
      description = "Default shell.";
    };

    terminal = mkOption {
      type = types.nullOr (
        types.enum [
          "wezterm"
        ]
      );

      default = null;
      description = "Default terminal emulator.";
    };

    wallpaper = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Path to the wallpaper.";
    };
  };
}

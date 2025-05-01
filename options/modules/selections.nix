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

    monitors = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            name = mkOption {
              type = types.str;
            };

            pos_x = mkOption {
              type = types.str;
            };

            pos_y = mkOption {
              type = types.str;
            };

            rate = mkOption {
              type = types.str;
              default = "60";
            };

            resolution = mkOption {
              type = types.str;
            };

            scale = mkOption {
              type = types.str;
              default = "1";
            };
          };
        }
      );

      default = [ ];
      description = "Monitor configurations.";
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
          "foot"
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

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
          "helix"
          "zed-editor"
        ]
      );

      default = null;
      description = "Default editor.";
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

    monitors = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            output = mkOption {
              type = types.str;
              description = "Display output.";
            };

            height = mkOption {
              type = types.ints.positive;
              description = "Monitor height in pixels.";
            };

            width = mkOption {
              type = types.ints.positive;
              description = "Monitor width in pixels.";
            };

            pos_x = mkOption {
              type = types.int;
              description = "Position on the x-axis.";
            };

            pos_y = mkOption {
              type = types.int;
              description = "Position on the y-axis.";
            };

            rate = mkOption {
              type = types.ints.positive;
              default = 60;
              description = "Monitor refresh rate in Hz.";
            };

            scale = mkOption {
              type = types.numbers.positive;
              default = 1;
              description = "Scale factor.";
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
          "bash"
          "fish"
          "zsh"
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

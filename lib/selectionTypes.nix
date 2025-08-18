{ lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

in
{
  desktop.type = types.nullOr (
    types.enum [
      "aerospace"
      "sway"
    ]
  );

  editor.type = types.nullOr (
    types.enum [
      "helix"
      "micro"
    ]
  );

  gpu.type = types.nullOr (
    types.enum [
      "amd"
    ]
  );

  monitors.type = types.listOf (
    types.submodule {
      options = {
        name = mkOption {
          type = types.str;
          description = "Display output.";
        };

        width = mkOption {
          type = types.ints.positive;
          description = "Monitor width in pixels.";
        };

        height = mkOption {
          type = types.ints.positive;
          description = "Monitor height in pixels.";
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

  shell.type = types.nullOr (
    types.enum [
      "fish"
      "zsh"
    ]
  );

  terminal.type = types.nullOr (
    types.enum [
      "foot"
      "rio"
      "wezterm"
    ]
  );
}

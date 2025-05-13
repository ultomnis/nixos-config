{ lib, pkgs, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  inherit (pkgs.stdenv) isLinux;

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
            height = mkOption {
              type = types.int;
            };

            width = mkOption {
              type = types.int;
            };

            name = mkOption {
              type = types.str;
            };

            pos_x = mkOption {
              type = types.int;
            };

            pos_y = mkOption {
              type = types.int;
            };

            rate = mkOption {
              type = types.int;
              default = 60;
            };

            scale = mkOption {
              type = types.int;
              default = 1;
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
          "shadow"
        ]
      );

      default = if isLinux then "shadow" else null;
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

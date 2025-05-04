{
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  desktop = if (osConfig != null) then osConfig.luminosity.selections.desktop else null;
  launcher = if (osConfig != null) then osConfig.luminosity.selections.launcher else null;
  monitors = if (osConfig != null) then osConfig.luminosity.selections.monitors else [ ];
  shell = if (osConfig != null) then osConfig.luminosity.selections.shell else null;
  terminal = if (osConfig != null) then osConfig.luminosity.selections.terminal else null;
  wallpaper = if (osConfig != null) then osConfig.luminosity.selections.wallpaper else null;

in
{
  options.luminosity.home.selections = {
    desktop = mkOption {
      type = types.nullOr types.str;
      default = desktop;
      description = "Desktop environment selection.";
    };

    launcher = mkOption {
      type = types.nullOr types.str;
      default = launcher;
      description = "Application launcher selection.";
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

      default = monitors;
      description = "Monitor selections.";
    };

    shell = mkOption {
      type = types.nullOr types.str;
      default = shell;
      description = "Shell selection.";
    };

    terminal = mkOption {
      type = types.nullOr types.str;
      default = terminal;
      description = "Terminal emulator selection.";
    };

    wallpaper = mkOption {
      type = types.nullOr types.path;
      default = wallpaper;
      description = "Wallpaper selection.";
    };
  };
}

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

  desktopSelection = if (osConfig != null) then osConfig.luminosity.selections.desktop else null;
  launcherSelection = if (osConfig != null) then osConfig.luminosity.selections.launcher else null;
  monitorSelections = if (osConfig != null) then osConfig.luminosity.selections.monitors else [ ];
  shellSelection = if (osConfig != null) then osConfig.luminosity.selections.shell else null;
  terminalSelection = if (osConfig != null) then osConfig.luminosity.selections.terminal else null;
  wallpaperSelection = if (osConfig != null) then osConfig.luminosity.selections.wallpaper else null;

in
{
  options.luminosity.home.selections = {
    desktop = mkOption {
      type = types.nullOr types.str;
      default = desktopSelection;
      description = "Desktop environment selection.";
    };

    launcher = mkOption {
      type = types.nullOr types.str;
      default = launcherSelection;
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

      default = monitorSelections;
      description = "Monitor selections";
    };

    shell = mkOption {
      type = types.nullOr types.str;
      default = shellSelection;
      description = "Shell selection.";
    };

    terminal = mkOption {
      type = types.nullOr types.str;
      default = terminalSelection;
      description = "Terminal emulator selection.";
    };

    wallpaper = mkOption {
      type = types.nullOr types.path;
      default = wallpaperSelection;
      description = "Wallpaper selection.";
    };
  };
}

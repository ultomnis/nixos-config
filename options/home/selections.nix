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

  shellSelection = if (osConfig != null) then osConfig.luminosity.selections.shell else null;

  terminalSelection = if (osConfig != null) then osConfig.luminosity.selections.terminal else null;

  wallpaperSelection = if (osConfig != null) then osConfig.luminosity.selections.wallpaper else null;

in
{
  options.luminosity.home.selections = {
    desktop = mkOption {
      type = types.nullOr types.str;
      default = desktopSelection;
      description = "Selected desktop environment.";
    };

    launcher = mkOption {
      type = types.nullOr types.str;
      default = launcherSelection;
      description = "Selected application launcher.";
    };

    shell = mkOption {
      type = types.nullOr types.str;
      default = shellSelection;
      description = "Selected shell.";
    };

    terminal = mkOption {
      type = types.nullOr types.str;
      default = terminalSelection;
      description = "Selected terminal emulator.";
    };

    wallpaper = mkOption {
      type = types.nullOr types.path;
      default = wallpaperSelection;
      description = "Selected wallpaper.";
    };
  };
}

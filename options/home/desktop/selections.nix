{ lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

in
{
  options.luminosity.desktop.selections = {
    launcher = mkOption {
      type = types.nullOr (
        types.enum [
          "fuzzel"
        ]
      );

      default = null;
      description = "Application launcher selection.";
    };

    terminal = mkOption {
      type = types.nullOr (
        types.enum [
          "wezterm"
        ]
      );

      default = null;
      description = "Terminal selection.";
    };

    wallpaper = mkOption {
      type = types.nullOr types.path;
      default = null;
      description = "Path to the wallpaper.";
    };
  };
}

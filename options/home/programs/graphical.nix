{
  config,
  customLib,
  lib,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  mkGraphicalOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.programs.graphical.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.programs.graphical = {
    anki.enable = mkGraphicalOption "Anki";
    blender.enable = mkGraphicalOption "Blender";
    dolphin.enable = mkGraphicalOption "Dolphin";
    falkon.enable = mkGraphicalOption "Falkon";

    foot = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.terminal == "foot";
        description = "Whether to enable foot.";
      };

      font = {
        name = mkOption {
          type = types.nullOr types.str;
          default = config.luminosity.home.desktop.environment.fonts.mono;
          description = "Font for foot.";
        };

        size = mkOption {
          type = types.nullOr types.int;
          default = config.luminosity.home.desktop.environment.fonts.size;
          description = "Font size for foot.";
        };
      };

      shell = mkOption {
        inherit (selectionTypes.shell) type;
        default = config.luminosity.home.selections.shell;
        description = "Shell for foot.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = "rose-pine";
        description = "Theme for foot.";
      };
    };

    godot.enable = mkGraphicalOption "Godot";
    keepassxc.enable = mkGraphicalOption "KeePassXC";
    koko.enable = mkGraphicalOption "Koko";
    krita.enable = mkGraphicalOption "Krita";
    mangohud.enable = mkGraphicalOption "MangoHud";
    mpv.enable = mkGraphicalOption "MPV";
    nexusmods-app.enable = mkGraphicalOption "Nexus Mods App";
    obs-studio.enable = mkGraphicalOption "OBS Studio";
    okular.enable = mkGraphicalOption "Okular";
    photoqt.enable = mkGraphicalOption "PhotoQt";
    qtsvg.enable = mkGraphicalOption "Qt SVG";
    qutebrowser.enable = mkGraphicalOption "qutebrowser";
    utm.enable = mkGraphicalOption "UTM";

    wezterm = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.terminal == "wezterm";
        description = "Whether to enable WezTerm.";
      };

      font = {
        name = mkOption {
          type = types.nullOr types.str;
          default = config.luminosity.home.desktop.environment.fonts.mono;
          description = "Font for WezTerm.";
        };

        size = mkOption {
          type = types.nullOr types.int;
          default = config.luminosity.home.desktop.environment.fonts.size;
          description = "Font size for WezTerm.";
        };
      };

      maxFPS = mkOption {
        type = types.ints.positive;
        default = 60;
        description = "Maximum FPS for WezTerm.";
      };

      shell = mkOption {
        inherit (selectionTypes.shell) type;
        default = config.luminosity.home.selections.shell;
        description = "Shell for WezTerm.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = "rose-pine";
        description = "Theme for WezTerm.";
      };
    };

    zathura.enable = mkGraphicalOption "zathura";

    zed-editor = {
      enable = mkGraphicalOption "Zed";

      font = {
        name = mkOption {
          type = types.nullOr types.str;
          default = config.luminosity.home.desktop.environment.fonts.mono;
          description = "Font for Zed.";
        };

        size = mkOption {
          type = types.nullOr types.int;
          default = config.luminosity.home.desktop.environment.fonts.size;
          description = "Font size for Zed.";
        };
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = "Rosé Pine";
        description = "Theme for Zed.";
      };
    };
  };
}

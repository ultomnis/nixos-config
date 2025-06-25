{
  config,
  customLib,
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  customConfig = if (osConfig != null) then osConfig else config;

  mkGraphicalOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.programs.graphical.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.home.programs.graphical = {
    anki = mkGraphicalOption "Anki" { };
    blender = mkGraphicalOption "Blender" { };
    dolphin = mkGraphicalOption "Dolphin" { };
    falkon = mkGraphicalOption "Falkon" { };

    foot = {
      enable = mkOption {
        type = types.bool;
        default = customConfig.luminosity.selections.terminal == "foot";
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
        default = customConfig.luminosity.selections.shell;
        description = "Shell for foot.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = "rose-pine";
        description = "Theme for foot.";
      };
    };

    godot = mkGraphicalOption "Godot" { };
    keepassxc = mkGraphicalOption "KeePassXC" { };
    krita = mkGraphicalOption "Krita" { };
    mangohud = mkGraphicalOption "MangoHud" { };
    mpv = mkGraphicalOption "MPV" { };
    nexusmods-app = mkGraphicalOption "Nexus Mods App" { };
    obs-studio = mkGraphicalOption "OBS Studio" { };
    pwvucontrol = mkGraphicalOption "pwvucontrol" { };
    qview = mkGraphicalOption "qView" { };
    utm = mkGraphicalOption "UTM" { };

    wezterm = {
      enable = mkOption {
        type = types.bool;
        default = customConfig.luminosity.selections.terminal == "wezterm";
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
        default = customConfig.luminosity.selections.shell;
        description = "Shell for WezTerm.";
      };

      theme = mkOption {
        type = types.nullOr types.str;
        default = "rose-pine";
        description = "Theme for WezTerm.";
      };
    };

    zed-editor = mkGraphicalOption "Zed" {
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

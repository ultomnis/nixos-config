{
  config,
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    ;

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

    firefox = mkGraphicalOption "Firefox" {
      profiles = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              id = mkOption {
                type = types.ints.unsigned;
                description = "Profile ID.";
              };

              name = mkOption {
                type = types.str;
                description = "Profile name.";
              };
            };
          }
        );

        default = [ ];
        description = "List of Firefox profiles.";
      };
    };

    foot = {
      enable = mkOption {
        type = types.bool;
        default =
          (osConfig.luminosity.selections.terminal or config.luminosity.selections.terminal) == "foot";
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
    };

    keepassxc = mkGraphicalOption "KeePassXC" { };
    mangohud = mkGraphicalOption "MangoHud" { };
    mpv = mkGraphicalOption "MPV" { };
    mullvad-browser = mkGraphicalOption "Mullvad Browser" { };
    nautilus = mkGraphicalOption "GNOME Files" { };
    nexusmods-app = mkGraphicalOption "Nexus Mods App" { };
    obs-studio = mkGraphicalOption "OBS Studio" { };
    piper = mkGraphicalOption "Piper" { };
    pwvucontrol = mkGraphicalOption "pwvucontrol" { };
    swayimg = mkGraphicalOption "swayimg" { };

    thunderbird = mkGraphicalOption "Thunderbird" {
      profiles = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              isDefault = mkEnableOption "Whether the profile is the default profile.";

              name = mkOption {
                type = types.str;
                description = "Profile name.";
              };
            };
          }
        );

        default = [ ];
        description = "List of Thunderbird profiles.";
      };
    };

    tor-browser = mkGraphicalOption "Tor Browser" { };
    utm = mkGraphicalOption "UTM" { };

    wezterm = {
      enable = mkOption {
        type = types.bool;
        default =
          (osConfig.luminosity.selections.terminal or config.luminosity.selections.terminal) == "wezterm";
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

      theme = mkOption {
        type = types.nullOr types.str;
        default = "rose-pine-moon";
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
    };
  };
}

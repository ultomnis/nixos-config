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

    foot = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.terminal == "foot";
        description = "Whether to enable foot.";
      };

      shell = mkOption {
        inherit (selectionTypes.shell) type;
        default = config.luminosity.home.selections.shell;
        description = "Shell for foot.";
      };
    };

    keepassxc.enable = mkGraphicalOption "KeePassXC";
    mangohud.enable = mkGraphicalOption "MangoHud";
    obs-studio.enable = mkGraphicalOption "OBS Studio";
    qutebrowser.enable = mkGraphicalOption "qutebrowser";
    utm.enable = mkGraphicalOption "UTM";

    wezterm = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.selections.terminal == "wezterm";
        description = "Whether to enable WezTerm.";
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
    };

    zed-editor.enable = mkGraphicalOption "Zed";
  };
}

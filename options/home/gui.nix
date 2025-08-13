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

  mkGuiOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.gui.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.gui = {
    anki.enable = mkGuiOption "Anki";
    blender.enable = mkGuiOption "Blender";

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

    godot.enable = mkGuiOption "Godot";
    keepassxc.enable = mkGuiOption "KeePassXC";
    koboldcpp.enable = mkGuiOption "KoboldCpp";
    krita.enable = mkGuiOption "Krita";
    localsend.enable = mkGuiOption "LocalSend";
    mangohud.enable = mkGuiOption "MangoHud";
    obs-studio.enable = mkGuiOption "OBS Studio";
    qutebrowser.enable = mkGuiOption "qutebrowser";
    utm.enable = mkGuiOption "UTM";

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
  };
}

{ customLib, lib, ... }:

let
  inherit (lib) mkOption;
  inherit (customLib) selectionTypes;

in
{
  options.luminosity.home.selections = {
    desktop = mkOption {
      inherit (selectionTypes.desktop) type;
      default = null;
      description = "Desktop environment selection.";
    };

    editor = mkOption {
      inherit (selectionTypes.editor) type;
      default = null;
      description = "Default editor.";
    };

    monitors = mkOption {
      inherit (selectionTypes.monitors) type;
      default = [ ];
      description = "Monitor configurations.";
    };

    shell = mkOption {
      inherit (selectionTypes.shell) type;
      default = null;
      description = "Default shell.";
    };

    terminal = mkOption {
      inherit (selectionTypes.terminal) type;
      default = null;
      description = "Default terminal emulator.";
    };
  };
}

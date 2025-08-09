{ customLib, lib, ... }:

let
  inherit (lib) mkOption;
  inherit (customLib) selectionTypes;

in
{
  options.luminosity.modules.selections = {
    desktop = mkOption {
      inherit (selectionTypes.desktop) type;
      default = null;
      description = "Desktop environment selection.";
    };

    gpu = mkOption {
      inherit (selectionTypes.gpu) type;
      default = null;
      description = "System GPU.";
    };

    shell = mkOption {
      inherit (selectionTypes.shell) type;
      default = null;
      description = "Default shell.";
    };
  };
}

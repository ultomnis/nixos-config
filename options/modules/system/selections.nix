{ lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

in
{
  options.luminosity.system.selections = {
    desktop = mkOption {
      type = types.nullOr (
        types.enum [
          "aerospace"
          "sway"
        ]
      );

      default = null;
      description = "Desktop environment selection.";
    };

    editor = mkOption {
      type = types.nullOr (
        types.enum [
          "hx"
        ]
      );

      default = null;
      description = "Default text editor.";
    };

    gpu = mkOption {
      type = types.nullOr (
        types.enum [
          "amd"
        ]
      );

      default = null;
      description = "System GPU.";
    };

    shell = mkOption {
      type = types.nullOr (
        types.enum [
          "fish"
        ]
      );

      default = null;
      description = "Terminal shell.";
    };
  };
}

{ lib, osConfig, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkEnvironmentOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = osConfig.luminosity.system.selections.desktop == (lib.toLower name);
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.desktop.environment = {
    aerospace = mkEnvironmentOption "AeroSpace" { };

    sway = mkEnvironmentOption "Sway" {
      output = mkOption {
        type = types.attrsOf (types.attrsOf types.str);
        default = { };
        description = "Define Sway outputs.";
      };
    };
  };
}

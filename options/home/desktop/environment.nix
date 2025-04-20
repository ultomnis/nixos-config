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
        default = osConfig.luminosity.system.selections.desktop == name;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.desktop.environment = {
    aerospace = mkEnvironmentOption "aerospace" { };

    sway = mkEnvironmentOption "sway" {
      output = mkOption {
        type = types.attrsOf (types.attrsOf types.str);
        default = { };
        description = "Define sway outputs.";
      };
    };
  };
}

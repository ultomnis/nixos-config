{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkConfigurationOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.home.desktop.configurations.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.home.desktop.configurations = {
    darwinDefaults = mkConfigurationOption "macOS user defaults" { };
    nixConfig = mkConfigurationOption "user-specific Nix settings" { };
    unfree = mkConfigurationOption "unfree software" { };

    variables = mkConfigurationOption "environment variables configuration" {
      extraVariables = mkOption {
        type =
          with types;
          lazyAttrsOf (oneOf [
            str
            path
            int
            float
          ]);

        default = { };
        description = "Extra environment variables to set at login.";
      };
    };
  };
}

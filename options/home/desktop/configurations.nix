{
  config,
  lib,
  osConfig ? null,
  ...
}:

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

  nixConfig =
    if (osConfig != null) then osConfig.luminosity.system.configurations.nixConfig.enable else false;
  unfree =
    if (osConfig != null) then osConfig.luminosity.system.configurations.unfree.enable else false;

in
{
  options.luminosity.home.desktop.configurations = {
    nixConfig.enable = mkOption {
      type = types.bool;
      default = nixConfig;
      description = "Whether to enable user-specific Nix settings.";
    };

    unfree.enable = mkOption {
      type = types.bool;
      default = unfree;
      description = "Whether to enable unfree software.";
    };

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

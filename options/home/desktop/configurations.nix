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

  mkConfigurationOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.desktop.configurations.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.home.desktop.configurations = {
    darwinDefaults.enable = mkConfigurationOption "macOS user defaults";
    nixConfig.enable = mkConfigurationOption "user-specific Nix settings";

    variables = {
      enable = mkConfigurationOption "environment variables configuration";

      editor = mkOption {
        inherit (selectionTypes.editor) type;
        default = config.luminosity.home.selections.editor;
        description = "EDITOR environment variable.";
      };

      extraVariables = mkOption {
        type = types.lazyAttrsOf (
          types.oneOf [
            types.float
            types.int
            types.path
            types.str
          ]
        );

        default = { };
        description = "Extra environment variables to set at login.";
      };

      terminal = mkOption {
        inherit (selectionTypes.terminal) type;
        default = config.luminosity.home.selections.terminal;
        description = "TERMINAL environment variable.";
      };
    };
  };
}

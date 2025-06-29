{
  config,
  customLib,
  lib,
  osConfig ? null,
  ...
}:

let
  inherit (lib)
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  customConfig = if (osConfig != null) then osConfig else config;

  mkConfigurationOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.home.desktop.configurations.enable;
      description = "Whether to enable " + name + ".";
    };

in
{
  options.luminosity.home.desktop.configurations = {
    darwinDefaults.enable = mkConfigurationOption "macOS user defaults";
    nixConfig.enable = mkConfigurationOption "user-specific Nix settings";
    unfree.enable = mkConfigurationOption "unfree software";

    variables = {
      enable = mkConfigurationOption "environment variables configuration";

      editor = mkOption {
        inherit (selectionTypes.editor) type;
        default = customConfig.luminosity.selections.editor;
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
        default = customConfig.luminosity.selections.terminal;
        description = "TERMINAL environment variable.";
      };
    };
  };
}

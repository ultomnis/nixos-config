{
  config,
  customLib,
  lib,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkOption
    types
    ;

  inherit (customLib) selectionTypes;

  mkConfigurationOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.system.configurations.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.system.configurations = {
    amdgpu = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.gpu == "amd";
        description = "Whether to enable AMD GPU configuration.";
      };
    };

    boot = mkConfigurationOption "boot configuration" { };
    locale = mkConfigurationOption "locale configuration" { };
    nixConfig = mkConfigurationOption "Nix settings" { };
    security = mkConfigurationOption "security configuration" { };
    unfree = mkConfigurationOption "unfree software" { };

    userConfig = mkConfigurationOption "user configuration" {
      users = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              hashedPasswordFile = mkOption {
                type = types.nullOr types.str;
                default = null;
                description = "File that contains hash of the user's password.";
              };

              homeManager = mkEnableOption "Whether to import user-specific Home Manager configurations.";

              name = mkOption {
                type = types.str;
                description = "The account username.";
              };

              shell = mkOption {
                inherit (selectionTypes.shell) type;
                default = config.luminosity.selections.shell;
                description = "User shell.";
              };

              uid = mkOption {
                type = types.nullOr types.int;
                default = null;
                description = "The account UID.";
              };
            };
          }
        );

        default = [ ];
        description = "User configurations.";
      };
    };

    zramSwap = mkConfigurationOption "zram swap space" { };
  };
}

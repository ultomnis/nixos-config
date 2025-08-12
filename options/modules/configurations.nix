{
  config,
  customLib,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib)
    mkEnableOption
    mkOption
    mkPackageOption
    types
    ;

  inherit (customLib) selectionTypes;

  mkConfigurationOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.modules.configurations.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.modules.configurations = {
    amdgpu = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.modules.selections.gpu == "amd";
        description = "Whether to enable AMD GPU configuration.";
      };
    };

    boot.enable = mkConfigurationOption "boot configuration";

    cursor = {
      enable = mkConfigurationOption "Stylix cursor configuration";

      package = mkPackageOption pkgs "cursor" {
        default = [
          "bibata-cursors"
        ];
      };

      name = mkOption {
        type = types.str;
        default = "Bibata-Modern-Ice";
        description = "Cursor name.";
      };

      size = mkOption {
        type = types.ints.positive;
        default = 24;
        description = "Cursor size.";
      };
    };

    i2c.enable = mkConfigurationOption "Inter-Integrated Circuit";
    locale.enable = mkConfigurationOption "locale configuration";
    nixConfig.enable = mkConfigurationOption "Nix settings";
    security.enable = mkConfigurationOption "security configuration";
    unfree.enable = mkConfigurationOption "unfree software";

    userConfig = {
      enable = mkConfigurationOption "user configuration";

      users = mkOption {
        type = types.listOf (
          types.submodule {
            options = {
              hashedPasswordFile = mkOption {
                type = types.nullOr types.str;
                default = null;
                description = "File that contains hash of the user's password.";
              };

              homeManager = mkEnableOption "user-specific Home Manager configurations";

              name = mkOption {
                type = types.str;
                description = "The account username.";
              };

              shell = mkOption {
                inherit (selectionTypes.shell) type;
                default = config.luminosity.modules.selections.shell;
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

    zramSwap.enable = mkConfigurationOption "zram swap space";
  };
}

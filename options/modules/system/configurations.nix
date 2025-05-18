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
        default = config.luminosity.system.configurations.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

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
      uid = mkOption {
        type = types.nullOr types.int;
        default = null;
        description = "The account UID.";
      };
    };

    zramSwap = mkConfigurationOption "zram swap space" { };
  };
}

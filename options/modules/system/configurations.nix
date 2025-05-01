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
    boot = mkConfigurationOption "boot configuration" { };
    darwin = mkConfigurationOption "macOS settings" { };
    locale = mkConfigurationOption "locale configuration" { };
    nixConfig = mkConfigurationOption "Nix settings" { };
    unfree = mkConfigurationOption "unfree software" { };

    userConfig = mkConfigurationOption "user configuration" {
      uid = mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The account UID.";
      };
    };

    security = mkConfigurationOption "security configuration" { };
    zramSwap = mkConfigurationOption "zram swap space" { };
  };
}

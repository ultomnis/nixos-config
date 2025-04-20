{ config, lib, ... }:

let
  inherit (lib)
    mkEnableOption
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
    darwin = mkConfigurationOption "macOS configuration" { };
    locale = mkConfigurationOption "locale configuration" { };
    nixConfig = mkConfigurationOption "nix settings" { };

    primaryUser = mkConfigurationOption "user configuration" {
      name = mkOption {
        type = types.str;
        default = "nix";
        description = "Name of the primary user.";
      };

      uid = mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The account UID.";
      };
    };

    security = mkConfigurationOption "security-related options" { };

    variables = mkConfigurationOption "environment variables" {
      bitwarden.sshAgent.enable = mkEnableOption "Whether to enable the Bitwarden SSH Agent.";
    };

    zramSwap = mkConfigurationOption "zram swap space" { };
  };
}

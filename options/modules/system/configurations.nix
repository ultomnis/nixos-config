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
    darwin = mkConfigurationOption "macOS settings" { };
    locale = mkConfigurationOption "locale configuration" { };
    nixConfig = mkConfigurationOption "Nix settings" { };

    userConfig = mkConfigurationOption "user configuration" {
      uid = mkOption {
        type = types.nullOr (types.int);
        default = null;
        description = "The account UID.";
      };
    };

    security = mkConfigurationOption "security configuration" { };

    variables = mkConfigurationOption "environment variables" {
      bitwarden.sshAgent.enable = mkEnableOption "Whether to enable the Bitwarden SSH Agent.";
    };

    zramSwap = mkConfigurationOption "zram swap space" { };
  };
}

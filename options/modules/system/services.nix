{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkServiceOption =
    name: extraOptions:
    {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.system.services.enable;
        description = "Whether to enable " + name + ".";
      };
    }
    // extraOptions;

in
{
  options.luminosity.system.services = {
    bluetooth = mkServiceOption "Bluetooth" { };
    greetd = mkServiceOption "greetd" { };
    networkmanager = mkServiceOption "Network Manager" { };
    pipewire = mkServiceOption "PipeWire" { };
    printing = mkServiceOption "printing support" { };
    ratbagd = mkServiceOption "ratbagd" { };

    tailscale = mkServiceOption "Tailscale" {
      useRoutingFeatures = mkOption {
        type = types.enum [
          "none"
          "server"
          "client"
          "both"
        ];

        default = "none";
        description = "Routing features for Tailscale.";
      };
    };
  };
}

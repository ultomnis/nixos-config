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
    |> lib.recursiveUpdate extraOptions;

in
{
  options.luminosity.system.services = {
    avahi = mkServiceOption "Avahi" { };
    bluetooth = mkServiceOption "Bluetooth" { };
    geoclue2 = mkServiceOption "GeoClue 2" { };
    gvfs = mkServiceOption "GVfs" { };
    libvirtd = mkServiceOption "libvirtd" { };
    networkmanager = mkServiceOption "Network Manager" { };
    openssh = mkServiceOption "OpenSSH" { };
    pipewire = mkServiceOption "PipeWire" { };
    printing = mkServiceOption "printing support" { };
    ratbagd = mkServiceOption "ratbagd" { };
    rtkit = mkServiceOption "RealtimeKit" { };

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

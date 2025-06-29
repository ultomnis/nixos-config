{ config, lib, ... }:

let
  inherit (lib)
    mkOption
    types
    ;

  mkServiceOption =
    name:
    mkOption {
      type = types.bool;
      default = config.luminosity.system.services.enable;
      description = "Whether to enable " + name + ".";
    };

in
{
  options.luminosity.system.services = {
    avahi.enable = mkServiceOption "Avahi";
    bluetooth.enable = mkServiceOption "Bluetooth";
    geoclue2.enable = mkServiceOption "GeoClue 2";
    libvirtd.enable = mkServiceOption "libvirtd";
    networkmanager.enable = mkServiceOption "Network Manager";
    openssh.enable = mkServiceOption "OpenSSH";
    pipewire.enable = mkServiceOption "PipeWire";

    plasma = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.selections.desktop == "plasma";
        description = "Whether to enable KDE Plasma.";
      };
    };

    printing.enable = mkServiceOption "printing support";
    ratbagd.enable = mkServiceOption "ratbagd";
    rtkit.enable = mkServiceOption "RealtimeKit";

    tailscale = {
      enable = mkServiceOption "Tailscale";

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

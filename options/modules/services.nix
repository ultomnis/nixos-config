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
      default = config.luminosity.modules.services.enable;
      description = "Whether to enable ${name}.";
    };

in
{
  options.luminosity.modules.services = {
    avahi.enable = mkServiceOption "Avahi";
    bluetooth.enable = mkServiceOption "Bluetooth";
    libvirtd.enable = mkServiceOption "libvirtd";
    networkmanager.enable = mkServiceOption "Network Manager";
    openssh.enable = mkServiceOption "OpenSSH";
    pipewire.enable = mkServiceOption "PipeWire";

    plasma = {
      enable = mkOption {
        type = types.bool;
        default = config.luminosity.modules.selections.desktop == "plasma";
        description = "Whether to enable KDE Plasma.";
      };
    };

    printing.enable = mkServiceOption "printing support";
    ratbagd.enable = mkServiceOption "ratbagd";
    rtkit.enable = mkServiceOption "RealtimeKit";
  };
}

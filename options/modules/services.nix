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
    mullvad-vpn.enable = mkServiceOption "Mullvad VPN";
    networkmanager.enable = mkServiceOption "Network Manager";
    openssh.enable = mkServiceOption "OpenSSH";
    pipewire.enable = mkServiceOption "PipeWire";
    printing.enable = mkServiceOption "printing support";
    ratbagd.enable = mkServiceOption "ratbagd";
    rtkit.enable = mkServiceOption "RealtimeKit";
  };
}
